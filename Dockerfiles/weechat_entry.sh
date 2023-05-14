#!/usr/bin/env sh
# Create log file if not exists so the container stays up
touch /weechat/weechat.log

# As per https://latest.glowing-bear.org/ -> "Use TLS encryption" section
cat /etc/letsencrypt/live/irc.int3nse.com/fullchain.pem /etc/letsencrypt/live/irc.int3nse.com/privkey.pem > /weechat/tls/relay.pem

# Don't screw up permissions
chown user:user -R /weechat

# Don't run headlessly but don't use current tty either
su - user -c "export WEECHAT_HOME=$WEECHAT_HOME; screen -d -m weechat"

# Keep the container alive
tail -n1 -f /weechat/weechat.log