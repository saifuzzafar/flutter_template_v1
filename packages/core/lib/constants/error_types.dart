enum ErrorType {
  ioexception,
  ui,

  //ui
  emptyEmail,
  invalidEmail,
  invalidEmailPassword,
  emptyTempPassword,
  emptyPassword,
  passwordMismatch,
  emptyConfirmPassword,
  passwordConfirmPasswordNotMatch,
  pinConfirmPinNotMatch,
  agreeTerms,
  emptyOtp,
  emptyPin,
  invalidEmailPIN,
  pinAndConfirmPinNotMatch,
  emptyAnswer,
  emptyPhone,
  unknown,
  textFieldValidation,

  //DB ERROR
  database,
  databaseNotSupported,
  userPresentInDb,
  userNotFound,
  emailNotFound,
  errorNewPassword,
  errorPin,
  dbError,
  dbUserNotFound,
  errorPinSignIn,
  errorEmptyList,
  invalidEmailOtpLength,
  makeSureAllAnswerFieldCompulsoryAndNotEmpty,
  emptyFeedBackMessage,
  emptyRating,
  //filter error
  filterError
}
