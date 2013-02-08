require 'rack/session/cookie'

module Rack
  module Session
    class Cookie
      def load_session(env)
        request = Rack::Request.new(env)
        session_data = request.cookies[@key]

        if @secret && session_data
          session_data, digest = session_data.split("--")
          session_data = nil  unless secure_compare(digest, generate_hmac(session_data))
        end

        begin
          session_data = session_data.unpack("m*").first
          session_data = Marshal.load(session_data)
          env["rack.session"] = session_data
        rescue
          env["rack.session"] = Hash.new
        end

        env["rack.session.options"] = @default_options.dup
      end

      private

      # Private: Securely compares two strings; based on http://git.io/9nANxg
      #
      # See also CVE-2013-0263.
      def secure_compare(a, b)
        return false unless a && b && a.size == b.size

        l = a.unpack("C*")

        r, i = 0, -1
        b.split('').each { |v| r |= v.unpack('C*').first ^ l[i+=1] }
        r == 0
      end
    end
  end
end
