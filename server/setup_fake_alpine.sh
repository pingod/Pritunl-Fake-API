export ORIG_API_SERVER='app.pritunl.com'
export ORIG_API_SERVER_ESCAPED=$(echo "$ORIG_API_SERVER" | sed -e 's/\./\\./g')
export ORIG_AUTH_SERVER='auth.pritunl.com'
export ORIG_AUTH_SERVER_ESCAPED=$(echo "$ORIG_AUTH_SERVER" | sed -e 's/\./\\./g')

export FAKE_API_SERVER='pritunl-api.simonmicro.de'
export FAKE_API_SERVER_ESCAPED=$(echo "$FAKE_API_SERVER" | sed -e 's/\./\\./g')
export FAKE_AUTH_SERVER="$FAKE_API_SERVER/auth/"
export FAKE_AUTH_SERVER_ESCAPED=$(echo "$FAKE_AUTH_SERVER" | sed -e 's/\./\\./g')

#find /usr/lib/python2.7 -type f -print0 | xargs -0 grep -o 'app.pritunl.com'
find /usr/lib/python2.7 -type f -print0 | xargs -0 sed -i "s/$ORIG_API_SERVER_ESCAPED/$FAKE_API_SERVER_ESCAPED/g"
#find /usr/lib/python2.7 -type f -print0 | xargs -0 grep -o 'pritunl-api.simonmicro.de'


find /usr/share/pritunl/www/ -type f -print0 | xargs -0 sed -i "s/$ORIG_API_SERVER_ESCAPED/$FAKE_API_SERVER_ESCAPED/g"
#find /usr/share/pritunl/www/ -type f -print0 | xargs -0 grep -o 'pritunl-api.simonmicro.de'

find /usr/lib/python2.7 -type f -print0 | xargs -0 sed -i "s#$ORIG_AUTH_SERVER_ESCAPED#$FAKE_AUTH_SERVER_ESCAPED#g"


find /usr/share/pritunl/www/ -type f -print0 | xargs -0 sed -i "s/$ORIG_AUTH_SERVER_ESCAPED/$FAKE_AUTH_SERVER_ESCAPED/g"
