part of "pages.dart";

class BookForm extends StatefulWidget {
  const BookForm({ Key? key }) : super(key: key);

  @override
  _BookFormState createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {

  final _bookingKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPhoneNum = TextEditingController();
  final ctrlFullName = TextEditingController();
  final ctrlCity = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    ctrlEmail.dispose();
    ctrlPhoneNum.dispose();
    ctrlFullName.dispose();
    ctrlCity.dispose();

    super.dispose();
  }

  bool isDigit(String input){
    return int.tryParse(input) == null ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Form"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Form(
              key: _bookingKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()
                    ),
                    controller: ctrlFullName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(value.toString() == ""){
                        return "Full name can not be empty";
                      }
                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder()
                    ),
                    controller: ctrlEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      return !EmailValidator.validate(value.toString()) ? 
                        "Email format is not valid" :
                        null;
                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder()
                    ),
                    controller: ctrlPhoneNum,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!isDigit(value.toString())){
                        return "Phone number must only contain numeric values";
                      }
        
                      if(value.toString().length < 7){
                        return "Phone number must have minimum length of 7 digit";
                      }
                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "City",
                      prefixIcon: Icon(Icons.location_city),
                      border: OutlineInputBorder()
                    ),
                    controller: ctrlCity,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(value.toString() == ""){
                        return "City can not be empty";
                      }
                    },
                  ),
                  SizedBox(height: 60,),
                  ElevatedButton(
                    onPressed: (() {
                      if(_bookingKey.currentState!.validate()){
                        NAlertDialog(
                          dialogStyle: DialogStyle(titleDivider: true),
                          title: Text("Data Confirmation"),
                          content: Wrap(
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Text("Full name: " + ctrlFullName.text),
                                    Text("Email: " + ctrlEmail.text),
                                    Text("Phone Number: " + ctrlPhoneNum.text),
                                    Text("City: " + ctrlCity.text),
                                  ],
                                ),
                              ),
                            ]
                          ),
                          actions: <Widget>[
                            TextButton(child: Text("Close"), onPressed: () => Navigator.pop(context)),
                            TextButton(child: Text("Okay"), onPressed: () => Navigator.pushAndRemoveUntil<dynamic>(
                                context, 
                                MaterialPageRoute<dynamic>(
                                  builder: ((context) => AnimeDetailPage()),
                                ), 
                                (route) => false
                              )
                            ),
                          ],
                        ).show(context);
                      }else{
                        NAlertDialog(
                          dialogStyle: DialogStyle(titleDivider: true),
                          title: Text("Invalid Inputs!"),
                          content: Text("Please check your input fields"),
                          actions: <Widget>[
                            TextButton(child: Text("Okay"), onPressed: () => Navigator.pop(context)),
                          ],
                        ).show(context);
                      }
                    }), 
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10)
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}