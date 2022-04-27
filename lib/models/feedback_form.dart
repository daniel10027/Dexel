class FeedBackForm{

  String _nom;
  String _email;
  String _contact;
  String _feedback;

  FeedBackForm(this._nom, this._email, this._contact, this._feedback);

  String toParams() => "?nom=$_nom&email=$_email&contact=$_contact&feedback=$_feedback";

}
