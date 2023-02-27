import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:multiselect/multiselect.dart';

import '../../../utils/constants.dart';

class ChangeParticularsDetails extends StatefulWidget {
  const ChangeParticularsDetails({super.key, this.pageTitle});

  final String? pageTitle;

  @override
  State<ChangeParticularsDetails> createState() =>
      _ChangeParticularsDetailsState();
}

class _ChangeParticularsDetailsState extends State<ChangeParticularsDetails> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = 'Writer';
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

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
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Email Address',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email address is required';
                  }
                  return null;
                },
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Phone Number',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone Number is required';
                  }
                  return null;
                },
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Residence',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Residence is required';
                  }
                  return null;
                },
                controller: _emailCtrl,
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
            children: [
              _buildTextField(
                labelText: 'Business Name *',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Company Name is required';
                  }
                  return null;
                },
                controller: _emailCtrl,
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
                      _buildSelector(
                        context: context,
                        name: 'LTD',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
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
                labelText: 'Registration Number*',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Person's Name is required";
                  }
                  return null;
                },
                controller: _emailCtrl,
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
                controller: _emailCtrl,
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
                controller: _emailCtrl,
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
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: 'ISIC Code 2*',
                controller: _emailCtrl,
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: 'ISIC Code 3*',
                controller: _emailCtrl,
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: 'ISIC Code4*',
                controller: _emailCtrl,
              ),
              SizedBox(
                height: 5,
              ),
              _buildTextField(
                labelText: "Describe Company's business activities",
                controller: _emailCtrl,
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
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                    controller: _emailCtrl,
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Digital  Address*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'P.O BOX',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'PMB',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'DTD',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
              ),
              Text(
                "Fill Postal Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'C / O',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Number*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Town*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Phone No 2',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Mobile No 1*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Mobile No 2',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Fax',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Email Address*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Website',
                controller: _emailCtrl,
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
                  Row(
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
                        style: TextStyle(fontFamily: 'Poppins-SemiBold'),
                      ),
                    ],
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
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'Mr',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'Mrs',
                      ),
                      _buildSelector(
                        context: context,
                        name: 'Miss',
                      ),
                      _buildSelector(
                        context: context,
                        name: 'Ms',
                      ),
                      _buildSelector(
                        context: context,
                        name: 'Dr',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
              ),
              Text(
                "Fill Postal Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'C / O',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Number*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Town*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'P.O BOX',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'PMB',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'DTD',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
              ),
              Text(
                "Fill Postal Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'C / O',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Number*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Town*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'P.O BOX',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'PMB',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'DTD',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
              ),
              Text(
                "Fill Postal Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'C / O',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Number*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Town*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
                controller: _emailCtrl,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type *"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      _buildSelector(
                        context: context,
                        name: 'P.O BOX',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'PMB',
                      ),
                      SizedBox(width: 5.0),
                      _buildSelector(
                        context: context,
                        name: 'DTD',
                      ),
                    ],
                  ),
                ],
              ),
              _buildTextField(
                labelText: 'Street Name*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'City*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'District*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
              ),
              Text(
                "Fill Postal Address",
                style: TextStyle(fontFamily: 'Poppins-SemiBold'),
              ),
              _buildTextField(
                labelText: 'C / O',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'House/Building/Flat No.*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Number*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Town*',
                controller: _emailCtrl,
              ),
              _buildTextField(
                labelText: 'Region*',
                controller: _emailCtrl,
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
        print('Steps completed!');
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
                      padding: const EdgeInsets.only(top: 10, left: 70),
                      child: Text(
                        "Change of Particulars",
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
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
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
                SizedBox(
                  height: 10,
                ),
                Text('${widget.pageTitle}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
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
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
