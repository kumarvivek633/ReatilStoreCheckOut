package com.retailstore.checkout.controller;

import com.retailstore.checkout.dao.util.ErrorCodes;

/**
 * The Class RetailStoreApplicationException.
 */
public class RetailStoreApplicationException extends RuntimeException {

	/** For serialization. */
	private static final long serialVersionUID = 1;

	/** Error code. */
	private final ErrorCodes errorCode;

	/** The field that caused the error if there is one . */
	private final String field;

	/**
	 * Constructor to set error message.
	 *
	 * @param message
	 *            - error message
	 * @param errorCode
	 *            - error error code
	 */
	public RetailStoreApplicationException(final String message, final ErrorCodes errorCode) {
		this(message, errorCode, null);
	}

	/**
	 * Constructor to set error message.
	 *
	 * @param message
	 *            - error message
	 * @param errorCode
	 *            - error error code
	 * @param field
	 *            - the input field that caused the error
	 *
	 */
	public RetailStoreApplicationException(final String message, final ErrorCodes errorCode, String field) {
		super(message);
		this.errorCode = errorCode;
		this.field = field;
	}

	/**
	 * Constructor to set error message and <code>Throwable</code> instance.
	 *
	 * @param message
	 *            - error message
	 * @param exception
	 *            - <code>Throwable</code> instance
	 */
	public RetailStoreApplicationException(final String message, final Throwable exception) {
		super(message, exception);
		this.errorCode = ErrorCodes.INTERNAL_SERVER_ERROR;
		this.field = null;
	}

	/**
	 * Constructor to set error message and <code>Throwable</code> instance.
	 *
	 * @param message
	 *            - error message
	 * @param exception
	 *            - <code>Throwable</code> instance
	 * @param errorCode
	 *            - error error code
	 */
	public RetailStoreApplicationException(final String message, final Throwable exception,
			final ErrorCodes errorCode) {
		this(message, exception, errorCode, null);
	}

	/**
	 * Constructor to set error message and <code>Throwable</code> instance.
	 *
	 * @param message
	 *            - error message
	 * @param exception
	 *            - <code>Throwable</code> instance
	 * @param errorCode
	 *            - error error code
	 * @param field
	 *            - the input field that caused the error
	 */
	public RetailStoreApplicationException(final String message, final Throwable exception, final ErrorCodes errorCode,
			final String field) {
		super(message, exception);
		this.errorCode = errorCode;
		this.field = field;
	}

	/**
	 * Return the error code.
	 *
	 * @return the errorCode
	 */
	public ErrorCodes getErrorCode() {
		return errorCode;
	}

	/**
	 * Gets the field.
	 *
	 * @return the field
	 */
	public String getField() {
		return field;
	}

}
