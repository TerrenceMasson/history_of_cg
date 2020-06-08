#!/usr/bin/env python
import os
import sys
import re
 
 
def read_env():
    """Pulled from Honcho code with minor updates, reads local default
    environment variables from a .env file located in the project root
    directory.
 
    """
    try:
        with open('../.env') as f:
            content = f.read()
    except IOError:
        content = ''
 
    for line in content.splitlines():
        m1 = re.match(r'\A([A-Za-z_0-9]+)=(.*)\Z', line)
        if m1:
            key, val = m1.group(1), m1.group(2)
            m2 = re.match(r"\A'(.*)'\Z", val)
            if m2:
                val = m2.group(1)
            m3 = re.match(r'\A"(.*)"\Z', val)
            if m3:
                val = re.sub(r'\\(.)', r'\1', m3.group(1))
            os.environ.setdefault(key, val)


if __name__ == "__main__":
    print("*** MANAGE PY MAIN - START ***", file=sys.stderr)
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings.development")

    from django.core.management import execute_from_command_line

    print("*** MANAGE PY MAIN - BEFORE READ_ENV ***", file=sys.stderr)

    read_env()

    print("*** MANAGE PY MAIN - AFTER READ_ENV ***", file=sys.stderr)

    execute_from_command_line(sys.argv)

    print("*** MANAGE PY MAIN - AFTER EXECUTE_FROM_COMMAND_LINE ***", file=sys.stderr)
