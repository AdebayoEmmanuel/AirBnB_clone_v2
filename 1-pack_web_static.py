#!/usr/bin/python3
from fabric.api import local, settings
from datetime import datetime

def do_pack():
    # Create the versions folder if it doesn't exist
    local("mkdir -p versions")

    # Get the current date and time
    now = datetime.now()
    timestamp = now.strftime("%Y%m%d%H%M%S")

    # Create the archive name
    archive_name = f"web_static_{timestamp}.tgz"

    # Create the archive
    with settings(warn_only=True):
        result = local(f"tar -zcvf versions/{archive_name} web_static")

    # Check if the archive was created successfully
    if result.failed:
        return None
    else:
        return f"versions/{archive_name}"
