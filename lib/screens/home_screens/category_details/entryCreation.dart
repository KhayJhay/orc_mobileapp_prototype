import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:registrar_general_prototype/apis/payment_api.dart';
import 'package:registrar_general_prototype/utils/constants.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:multiselect/multiselect.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class EntryCreationDetails extends StatefulWidget {
  const EntryCreationDetails({
    Key? key,
    this.pageTitle,
  }) : super(key: key);

  final String? pageTitle;

  @override
  State<EntryCreationDetails> createState() => _EntryCreationDetailsState();
}

class _EntryCreationDetailsState extends State<EntryCreationDetails> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Writer';
  String? selectedComp = 'Reader';
  bool isLoading = false;
  final T = TextEditingController();
  final TextEd = TextEditingController();
  final TextEditingController title = TextEditingController();
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    final dropdown = DropDownTextField(
      initialValue: "Mr.",
      listSpace: 20,
      textFieldDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Title',
      ),
      listPadding: ListPadding(top: 20),
      enableSearch: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownList: const [
        DropDownValueModel(name: 'Mr.', value: "Mr."),
        DropDownValueModel(name: 'Mrs', value: "Mrs"),
        DropDownValueModel(name: 'Miss', value: "Miss"),
        DropDownValueModel(name: 'Ms', value: "Ms"),
        DropDownValueModel(name: 'Dr', value: "Dr"),
      ],
      listTextStyle:
          const TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium'),
      dropDownItemCount: 3,
      onChanged: (val) {
        title.text = val.toString();
      },
    );

    final dropdownBOP = DropDownTextField(
      initialValue: "Apply for BOP Now",
      listSpace: 20,
      textFieldDecoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Bop Priority',
      ),
      listPadding: ListPadding(top: 20),
      enableSearch: false,
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownList: const [
        DropDownValueModel(
            name: 'Apply for BOP Now', value: "Apply for BOP Now"),
        DropDownValueModel(
            name: 'Apply for BOP Later', value: "Apply for BOP Later"),
        DropDownValueModel(
            name: 'Already have a BOP', value: "Already have a BOP"),
      ],
      listTextStyle:
          const TextStyle(color: Colors.black, fontFamily: 'Poppins-Medium'),
      dropDownItemCount: 3,
      onChanged: (val) {
        title.text = val.toString();
      },
    );

    final selectSectors = DropDownMultiSelect(
      onChanged: (List<String> x) {
        setState(() {
          selected = x;
        });
      },
      options: const [
        'Legal',
        'Education',
        'Utilities',
        'Tourism',
        'Quary/Mining',
        'Insurance',
        'Agriculture',
        'Oil & Gas',
        'Construction',
        'Telecom / ICT',
        'Estate/Housing',
        'Entertainment',
        'Food Industry',
        'Manufacturing',
        'Pharmaceutical'
            'Security',
        'Media',
        'Shipping & Port',
        'Hospitality',
        'Health Care',
        'Security / Brokers',
        'Commerce / Trading',
        'Banking and Finance',
        'Sanitation',
        'Transportation / Aerospace',
        'fashion / Beautification',
        'Refinery of Minerals',
        'Others(Please Specify)',
      ],
      selectedValues: selected,
      whenEmpty: 'Select Business Sectors',
    );

    final selectQualifications = DropDownMultiSelect(
      onChanged: (List<String> x) {
        setState(() {
          selected = x;
        });
      },
      options: const [
        'Professional qualification',
        'Tertiary level qualification',
        'Company Secretary Trainee',
        'Barrister or Solicitor in the Republic',
        'Institute of Chartered Accountants',
        'Under the supervision of a qualified\nCompany Secretary',
        'Institute of Chartered Secretaries\nand Administrators',
        'By virtue of an academic qualification',
      ],
      selectedValues: selected,
      whenEmpty: 'Select qualifications',
    );

    final steps = [
      CoolStep(
        title: 'Basic Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                labelText: 'Name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
              ),
              _buildTextField(
                labelText: 'Email Address',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email address is required';
                  }
                  return null;
                },
              ),
              _buildTextField(
                labelText: 'Phone Number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone Number is required';
                  }
                  return null;
                },
              ),
              _buildTextField(
                labelText: 'Residence',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Residence is required';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (A)',
        subtitle:
            'All fields marked with an asterisk(*) indicates a mandatory field',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Constitution Type*"),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  _buildSelector(
                    context: context,
                    name: 'Registered Constitution',
                  ),
                  SizedBox(width: 5.0),
                  _buildSelector(
                    context: context,
                    name: 'Standard Constitution',
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              _buildTextField(
                labelText: 'Company Name *',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Company Name is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ending With *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelectorCompany(
                        context: context,
                        name: 'LTD',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelectorCompany(
                        context: context,
                        name: 'Limited Company',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'Presented By*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Person's Name is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'TIN*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "TIN is required";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ghana Card is required";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (B)',
        subtitle:
            'All fields marked with an asterisk(*) indicates a mandatory field',
        content: Container(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select Sectors *"),
                  SizedBox(
                    height: 10,
                  ),
                  selectSectors,
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'Specify Business*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (C)',
        subtitle:
            'Select the International Standard Industrial Classifiaction (ISIC) code number(s) for the principal activities  ',
        content: Container(
          child: Column(
            children: [
              _buildTextField(
                labelText: 'ISIC Code 1*',
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: 'ISIC Code 2*',
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: 'ISIC Code 3*',
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: 'ISIC Code4*',
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: "Describe Company's business activities",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (D)',
        subtitle:
            'Specialized Institutions Such as Banks, Insurance and Security Companies are required to state their objects here.',
        content: Container(
          child: Column(
            children: [
              _buildbigTextField(
                labelText: 'Nature of Business',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (E)',
        subtitle:
            'Company must have a registered  office and this is the address to which the Registrar of  Companies may send Correspondence',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Registered  Office Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (F)',
        subtitle:
            'To get an accurate address, stand at the entrance  of the  said location or office',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Principal Place of Business",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Is the Principal Place of Business the same as the  registered office?",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "If Yes?",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: <Widget>[
                    _buildSelector(
                      context: context,
                      name: 'YES',
                    ),
                    SizedBox(
                      width: 200,
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "If No?",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                  _buildTextField(
                    labelText: 'Provide Details*',
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (G)',
        subtitle:
            'Companies that have multiple operational locations must complete this sectionn',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Other Places  Of Business",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (H)',
        subtitle:
            'A Register of Members is a register that contains the names and addresses of members of an incorporated Company.',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address at which Register of Members will be kept",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type *"),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 180,
                          child: _buildSelector(
                            context: context,
                            name: 'P.O BOX',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: SizedBox(
                            width: 180,
                            child: _buildSelector(
                              context: context,
                              name: 'PMB',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 180,
                          child: _buildSelector(
                            context: context,
                            name: 'DTD',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              Text(
                "Fill Postal Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'C / O',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Number*',
              ),
              _buildTextField(
                labelText: 'Town*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (I)',
        subtitle:
            'Applicants are to provide at least, one mobile phone number and an email',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact Of The Company",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Phone No 1*',
              ),
              _buildTextField(
                labelText: 'Phone No 2',
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
              ),
              _buildTextField(
                labelText: 'Fax',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Website',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (J)',
        subtitle:
            'Directors should be at least 18 years and above.Directors are to attach a statutory declaration and consent letter as stated in section 172 (2) of Act 992.',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Particulars of Directors of the Company",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Director 1",
                          style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Statutory Declaration & Consent Letter",
                          style: TextStyle(
                              fontFamily: 'Poppins-SemiBold', fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "A person shall not be appointed a director if",
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "i. That person within the preceding five years of the application for incorporation has been a director or senior manager of a Company that has become insolvent.",
                        maxLines: 4,
                        style: TextStyle(fontFamily: 'Poppins-Regular'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Applicable *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'YES',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ii. Charged with or convicted of a criminal offence involving fraud or dishonesty.",
                    maxLines: 4,
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Applicable *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelectorCompany(
                        context: context,
                        name: 'YES',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelectorCompany(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "iii. Charged with or convicted of a criminal offence relating to the promotion, incorporation or management of a company that has become insolvent.",
                    maxLines: 4,
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Applicable *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'YES',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Statutory Declaration Form *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelectorCompany(
                        context: context,
                        name: 'Consent Letter',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelectorCompany(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(
                    height: 10,
                  ),
                  dropdown
                ],
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender*"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Male',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Female',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Date  of Birth*',
              ),
              _buildTextField(
                labelText: 'Place of Birth*',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
              ),
              _buildTextField(
                labelText: 'Fax',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)',
              ),
              Text(
                "Residential Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              Text(
                "Occupational Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              _buildTextField(
                labelText: 'Particulars of other Directorships*',
              ),
              _buildTextField(
                labelText: "Director's Signature",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (K)',
        subtitle:
            'Directors should be at least 18 years and above.Directors are to attach a statutory declaration and consent letter as stated in section 172 (2) of Act 992.',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Particulars of Directors of the Company",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Director 2",
                          style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Statutory Declaration & Consent Letter",
                          style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "A person shall not be appointed a director if",
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "i. That person within the preceding five years of the application for incorporation has been a director or senior manager of a Company that has become insolvent.",
                        maxLines: 4,
                        style: TextStyle(fontFamily: 'Poppins-Regular'),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Applicable *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'YES',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ii. Charged with or convicted of a criminal offence involving fraud or dishonesty.",
                    maxLines: 4,
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Applicable *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelectorCompany(
                        context: context,
                        name: 'YES',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelectorCompany(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "iii. Charged with or convicted of a criminal offence relating to the promotion, incorporation or management of a company that has become insolvent.",
                    maxLines: 4,
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Choose Applicable *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelectorCompany(
                        context: context,
                        name: 'YES',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelectorCompany(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Statutory Declaration Form *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Consent Letter',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'NO',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(
                    height: 10,
                  ),
                  dropdown
                ],
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender*"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Male',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Female',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Date  of Birth*',
              ),
              _buildTextField(
                labelText: 'Place of Birth*',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
              ),
              _buildTextField(
                labelText: 'Fax',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)',
              ),
              Text(
                "Residential Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              Text(
                "Occupational Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              _buildTextField(
                labelText: 'Particulars of other Directorships*',
              ),
              _buildTextField(
                labelText: "Director's Signature",
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (L)',
        subtitle:
            'Tick the applicable qualification(s). Attach Consent Letter Reference to Section 211 (1) and (3) of Act 992',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Particulars of Company Secretary",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: selectQualifications,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Statutory Declaration Form *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Consent Letter',
                      ),
                      SizedBox(
                        width: 160,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(
                    height: 10,
                  ),
                  dropdown
                ],
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender*"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Male',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Female',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Date  of Birth*',
              ),
              _buildTextField(
                labelText: 'Place of Birth*',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
              ),
              _buildTextField(
                labelText: 'Fax',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)',
              ),
              Text(
                "Residential Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Country*',
              ),
              _buildTextField(
                labelText: 'Email Address*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (M)',
        subtitle:
            'The Corporate Body must have as one of its subscribers or operating officers a person who qualifies to be a Company Secretary.',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "In Case the Company Secretary is a Body Corporate",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Corporate Name*',
              ),
              _buildTextField(
                labelText: 'Coporate TIN*',
              ),
              _buildTextField(
                labelText: 'Digital Address*',
              ),
              _buildTextField(
                labelText: 'H/No.LMB*',
              ),
              _buildTextField(
                labelText: 'P.O. Box/DTD/PMB*',
              ),
              Text(
                "Name of person representing the",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Corporate Secretary*',
              ),
              _buildTextField(
                labelText: 'TIN of Representative*',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Signature(Corporate Rep)',
              ),
              _buildTextField(
                labelText: 'Corporate Stamp*',
              ),
              Text(
                "Attested by",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Director* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              _buildTextField(
                labelText: 'Secretaryr* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              Text(
                "Or in the Alternative",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Director* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              _buildTextField(
                labelText: 'Secretaryr* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (N)',
        subtitle:
            'A person shall be appointed an Auditor of a private company if that person is qualified and licensed in accordance with the Chartered Accountants Act, 1963 (Act 170). See section 138 (1) and 2) of Act 992.',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Auditor of the Company",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'TIN*',
              ),
              _buildTextField(
                labelText: "Auditors Firm Name*",
              ),
              _buildTextField(
                labelText: 'Digital Address*',
              ),
              _buildTextField(
                labelText: "Auditor's Firm Address P.O. Box*",
              ),
              _buildTextField(
                labelText: "PMB/DTD*",
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No. /LMB*',
              ),
              _buildTextField(
                labelText: 'Street Name*',
              ),
              _buildTextField(
                labelText: 'City*',
              ),
              _buildTextField(
                labelText: 'District*',
              ),
              _buildTextField(
                labelText: 'Region*',
              ),
              _buildTextField(
                labelText: 'Mobile No.*',
              ),
              _buildTextField(
                labelText: 'Office No.',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Attach Consent Letter from Auditor *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Consent Letter',
                      ),
                      SizedBox(
                        width: 160,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (0)',
        subtitle:
            'A subscriber is somebody who agrees to become a member of the company by the taking up shares at the inception of the company',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address and Description of Subscriber - Individual",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              Text(
                "This Section Must Be Filled with or Without a Registered Constitution",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins-Italic'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "I/We the undersigned are desirous of forming an incorporated Company in pursuance of this Constitution and we respectively agree to take the number of shares in the Company set opposite our respective names and to pay therefor in cash the consideration respectively stated",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subscriber 1",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  dropdown,
                ],
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              _buildTextField(
                labelText: 'TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)*',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Without TIN",
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                  Text(
                    "Fill the GRA TIN Form attached",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender*"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Male',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Female',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'Date  of Birth*',
              ),
              _buildTextField(
                labelText: 'Place of Birth*',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Digital Address*',
              ),
              _buildTextField(
                labelText: 'Address*',
              ),
              _buildTextField(
                labelText: 'Number of Shares to be Taken*',
              ),
              _buildTextField(
                labelText: 'Consideration Payable in Cash*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (P)',
        subtitle:
            'A subscriber is somebody who agrees to become a member of the company by the taking up shares at the inception of the company',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Address and Description of Subscriber - Individual",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subscriber 2",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  dropdown,
                ],
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              _buildTextField(
                labelText: 'TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)*',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Without TIN",
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                  Text(
                    "Fill the GRA TIN Form attached",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender*"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Male',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Female',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              _buildTextField(
                labelText: 'Date  of Birth*',
              ),
              _buildTextField(
                labelText: 'Place of Birth*',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Digital Address*',
              ),
              _buildTextField(
                labelText: 'Address*',
              ),
              _buildTextField(
                labelText: 'Number of Shares to be Taken*',
              ),
              _buildTextField(
                labelText: 'Consideration Payable in Cash*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (Q)',
        subtitle:
            'If there are more than one Corporate Subscribers, additional corporate subscribers forms shall be obtained from our website at www.rgd.gov.gh',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "In Case the Subscriber is a Body Corporate",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Corporate Name*',
              ),
              _buildTextField(
                labelText: 'Coporate TIN*',
              ),
              _buildTextField(
                labelText: 'Digital Address*',
              ),
              _buildTextField(
                labelText: 'Corporate Address H/No.LMB*',
              ),
              _buildTextField(
                labelText: 'P.O. Box/DTD/PMB*',
              ),
              _buildTextField(
                labelText: 'No. of Shares to be Taken*',
              ),
              _buildTextField(
                labelText: 'Consideration Payable in Cash*',
              ),
              _buildTextField(
                labelText: 'Name of Corporate Subscriber Representative*',
              ),
              _buildTextField(
                labelText: 'TIN of Representative*',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)*',
              ),
              _buildTextField(
                labelText: 'Signature(Corporate Rep)',
              ),
              _buildTextField(
                labelText: 'Corporate Stamp*',
              ),
              Text(
                "Attested by",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Director* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              _buildTextField(
                labelText: 'Secretaryr* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              Text(
                "Or in the Alternative",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Director* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              _buildTextField(
                labelText: 'Secretaryr* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (R)',
        subtitle:
            'Individual or Corporate Bodies that may be holding shares for minors',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Shares In Trust for Minor(s)",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                  Text(
                    "Address and Description of Trustee - Individual",
                    style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card(National Identity Card)*',
              ),
              _buildTextField(
                labelText: 'Trustee*',
              ),
              _buildTextField(
                labelText: 'First Name*',
              ),
              _buildTextField(
                labelText: 'Middle Name',
              ),
              _buildTextField(
                labelText: 'Last Name*',
              ),
              _buildTextField(
                labelText: 'Any Former Name',
              ),
              _buildTextField(
                labelText: 'Nationality*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
              _buildTextField(
                labelText: 'Digital Address',
              ),
              _buildTextField(
                labelText: 'Address',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Declaration*",
                    style: TextStyle(fontFamily: 'Poppins-Italic'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "That I/we hold the Share(s) and all dividends and interests accrued or to accrue on trust for the Owner and I/we undertake to transfer and deal, in all respects, and to pay the Share and any dividends, interest and other benefits thereon and accretions thereto in such manner as the Owner shall from time to time direct.",
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'No. of Shares to be Taken*',
              ),
              _buildTextField(
                labelText: 'Consideration Payable in Cash',
              ),
              _buildTextField(
                labelText: 'Name (Minor)*',
              ),
              _buildTextField(
                labelText: 'Date of Birth*',
              ),
              _buildTextField(
                labelText: 'Identification Type(ID)',
              ),
              _buildTextField(
                labelText: 'ID Reference Number',
              ),
              _buildTextField(
                labelText: 'Signature(Trustee)*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (S)',
        subtitle:
            'For authentication purposes, two officers of the company are to sign their signatures together with a seal or stamp of the company',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "In Case the Trustee is a Body Corporate",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Corporate Name*',
              ),
              _buildTextField(
                labelText: 'Coporate TIN*',
              ),
              _buildTextField(
                labelText: 'Corporate Address H/No.LMB*',
              ),
              _buildTextField(
                labelText: 'P.O. Box/DTD/PMB*',
              ),
              _buildTextField(
                labelText: 'Corporate Stamp*',
              ),
              Text(
                "Attested by",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Director* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              _buildTextField(
                labelText: 'Secretaryr* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              Text(
                "Or in the Alternative",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Director* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              _buildTextField(
                labelText: 'Secretaryr* / TIN',
              ),
              _buildTextField(
                labelText: 'Ghana Card*',
              ),
              _buildTextField(
                labelText: 'Name*',
              ),
              _buildTextField(
                labelText: 'Signature*',
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Declaration*",
                    style: TextStyle(fontFamily: 'Poppins-Italic'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "That I/we hold the Share(s) and all dividends and interests accrued or to accrue on trust for the Owner and I/we undertake to transfer and deal, in all respects, and to pay the Share and any dividends, interest and other benefits thereon and accretions thereto in such manner as the Owner shall from time to time direct.",
                    style: TextStyle(fontFamily: 'Poppins-Regular'),
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'No. of Shares to be Taken*',
              ),
              _buildTextField(
                labelText: 'Consideration Payable in Cash',
              ),
              _buildTextField(
                labelText: 'Name (Minor)*',
              ),
              _buildTextField(
                labelText: 'Date of Birth*',
              ),
              _buildTextField(
                labelText: 'Identification Type(ID)',
              ),
              _buildTextField(
                labelText: 'ID Reference Number',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (T)',
        subtitle:
            'The form must be signed by all subscribers in the presence of a witness, who shall attest to the signing.',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Witness to the above Signatures",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Date*',
              ),
              _buildTextField(
                labelText: 'Full Name*',
              ),
              _buildTextField(
                labelText: 'Witness  Signature*',
              ),
              _buildTextField(
                labelText: 'Address*',
              ),
              _buildTextField(
                labelText: 'Occupation*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (U)',
        subtitle: 'Section 35 (14) and (15) of Act 992',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Beneficial Owner(BO)",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "A beneficial owner (or owners) is the individual or natural person who owns, controls, has interest in, or exercises influence over the legal person (or arrangement) or receives substantial benefit from the applicant’s activity. A beneficial owner is an individual and cannot be a company",
                style: TextStyle(fontFamily: 'Poppins-Regular'),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: "SANCTIONS:",
                      style: TextStyle(
                          fontFamily: 'Poppins-Bold', color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                      text:
                          ' Failure to disclose is an offence and will attract sanctions and penalties.',
                      style: TextStyle(fontFamily: 'Poppins-Regular'),
                    ),
                  ])),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  "Fill the BO Form attached /Download from website www.rgd.gov.gh",
                  style: TextStyle(fontFamily: 'Poppins-Bold'),
                ),
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (V)',
        subtitle:
            'This is to determine the size of the Company i.e. small scale business, medium scale business or large scale business',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "MSME  Details",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'Revenue Envisaged*',
              ),
              _buildTextField(
                labelText: 'No. of Employees Envisaged*',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
      CoolStep(
        title: 'Company Information (W)',
        subtitle:
            'This is to determine the size of the Company i.e. small scale business, medium scale business or large scale business',
        content: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Business Operating Permit (BOP) Request",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: dropdownBOP,
              ),
              _buildTextField(
                labelText: 'Provide BOP Reference No.',
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
    ];

    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        showDialog(
            context: context,
            builder: (ctx) {
              return CupertinoAlertDialog(
                title: Text(
                  "Do you want to make payment?",
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      "cancel",
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      "Yes",
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = true;
                      });
                      Payment.getPaymentResponse(context).then((value) {
                        setState(() {
                          isLoading = false;
                        });
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: _height / 3.5,
              color: GlobalVars.kPrimary,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          IconlyLight.arrow_left_2,
                          color: Colors.white,
                          size: 18,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 100),
                      child: Text(
                        "Entity Creation",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Light',
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Positioned(
          top: 110,
          left: 0,
          right: 0,
          child: Container(
            height: _height,
            padding: EdgeInsets.only(
                top: _height < 820 ? 15 : 30, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/pngs/orclogo.png",
                      height: 80,
                    ),
                    Container(
                      height: 45,
                      width: 1.5,
                      color: GlobalVars.kPrimary,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Image.asset(
                      "assets/pngs/COA.png",
                      height: 40,
                    ),
                  ],
                ),
                Text('${widget.pageTitle}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: _height < 820 ? 12 : 15,
                    )),
                SizedBox(
                  height: 10,
                ),
                isLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: _height / 3.5),
                        child: Column(
                          children: [
                            SpinKitPulse(
                              size: 28,
                              color: GlobalVars.kPrimary,
                            ),
                            Text('Redirecting to ghana.gov'),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: _height / 1.5,
                        child: stepper,
                      )
              ],
            )),
          ),
        ),
      ]),
    );
  }

  Widget _buildTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  Widget _buildbigTextField({
    String? labelText,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        minLines: 2,
        maxLines: 8,
        decoration: InputDecoration(
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalVars.kSecondary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          contentPadding: EdgeInsets.all(15),
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  Widget _buildSelector({
    BuildContext? context,
    required String name,
  }) {
    final isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String? v) {
            setState(() {
              selectedRole = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectorCompany({
    BuildContext? context,
    required String name,
  }) {
    final isActive = name == selectedComp;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context!).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedComp,
          onChanged: (String? v) {
            setState(() {
              selectedComp = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
