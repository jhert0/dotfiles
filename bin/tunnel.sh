#!/bin/sh

RPORT="2000"
LPORT="2000"
USER="eof"
HOST="endoffile.org"

ssh -f "$USER@$HOST" -L "$LPORT:$HOST:$RPORT" -N
