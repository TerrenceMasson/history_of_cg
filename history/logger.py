import inspect, logging, os
from django.conf import settings

def log(*message):
    "Automatically log the current function details."
    if not settings.DEBUG:
        return
    message = "%s" % list(message)
    # Get the previous frame in the stack, otherwise it would be this function
    func = inspect.currentframe().f_back.f_code
    # Dump the message + the name of this function to the log.
    logging.debug("%s:%i - method: %s ===============\n=> %s \n ===============" % (
        os.path.relpath(func.co_filename, settings.PROJECT_PATH),
        func.co_firstlineno,
        func.co_name,
        message
    ))