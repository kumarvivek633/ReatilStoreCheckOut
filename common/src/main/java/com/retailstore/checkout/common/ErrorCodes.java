package com.retailstore.checkout.common;

/**
 * Group of business error codes.
 */
public enum ErrorCodes {

    /** The internal server error. */
    INTERNAL_SERVER_ERROR("internal.server.error", "Internal server error");

    /** The error code. */
    private String errorCode;

    /** The detail. */
    private String detail;

    /**
     * Instantiates a new error code.
     *
     * @param errorCode
     *            the error code
     * @param detail
     *            the detail
     */
    private ErrorCodes(final String errorCode, final String detail) {
        this.errorCode = errorCode;
        this.detail = detail;
    }

    /**
     * Gets the error code.
     *
     * @return the error code
     */
    public String getErrorCode() {
        return errorCode;
    }

    /**
     * Gets the detail.
     *
     * @return the detail
     */
    public String getDetail() {
        return detail;
    }

}
