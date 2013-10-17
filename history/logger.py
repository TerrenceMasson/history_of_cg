import inspect, logging, os
from django.conf import settings

logger = logging.getLogger('history')

def log(complex=True, *message):
    if settings.DEBUG or settings.TESTING:
        message = "%s" % list(message)
        if complex:
            # Get the previous frame in the stack, otherwise it would be this function
            func = inspect.currentframe().f_back.f_code
            # Dump the message + the name of this function to the log.
            logger.debug("%s:%i - method: %s ===============\n=> %s \n ===============" % (
                os.path.relpath(func.co_filename, settings.PROJECT_PATH),
                func.co_firstlineno,
                func.co_name,
                message
                ))
        else:
            logger.debug(message)

def log_simple(*message):
    log(False, message)

def log_complex(*message):
    log(True, message)
    

