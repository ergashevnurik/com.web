package com.Exception;

public class StorageExceptionNotFound extends StorageException {

    public StorageExceptionNotFound(String message) {
        super(message);
    }

    public StorageExceptionNotFound(String message, Throwable cause) {
        super(message, cause);
    }

}
