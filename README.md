# pulse-secure-vtm
Tools for Pulse Secure Virtual Traffic Manager

## hook.sh
Use with https://github.com/lukas2511/dehydrated as a hook-file. 
Posts new certificate to VTM after dehydrated decides that a renew is needed.
Aims to be as portable as possible. No dependency apart from bash and curl.