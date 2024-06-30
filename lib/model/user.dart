class User {
    String? userID;
    String? username;
    String? email;
    String? userPassword;
    String? tempPassword;
    String? userType;
    String? createdDate;
    String? version;
    String? token;
    String? name;
    String? contactNumber;
    String? verified;
    String? status;
    String? modifiedDate;
    String? supplierID;
    String? supplierName;
    String? areaID;
    String? supplierEmail;
    String? supplierContact;
    String? supplierCode;

    User({this.userID, this.username, this.email, this.userPassword, this.tempPassword, this.userType, this.createdDate, this.version, this.token, this.name, this.contactNumber, this.verified, this.status, this.modifiedDate, this.supplierID, this.supplierName, this.areaID, this.supplierEmail, this.supplierContact, this.supplierCode}); 

    User.fromJson(Map<String, dynamic> json) {
        userID = json['userID'];
        username = json['username'];
        email = json['email'];
        userPassword = json['userPassword'];
        tempPassword = json['tempPassword'];
        userType = json['userType'];
        createdDate = json['createdDate'];
        version = json['version'];
        token = json['token'];
        name = json['name'];
        contactNumber = json['contactNumber'];
        verified = json['verified'];
        status = json['status'];
        modifiedDate = json['modifiedDate'];
        supplierID = json['supplierID'];
        supplierName = json['supplierName'];
        areaID = json['areaID'];
        supplierEmail = json['supplierEmail'];
        supplierContact = json['supplierContact'];
        supplierCode = json['supplierCode'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['userID'] = userID;
        data['username'] = username;
        data['email'] = email;
        data['userPassword'] = userPassword;
        data['tempPassword'] = tempPassword;
        data['userType'] = userType;
        data['createdDate'] = createdDate;
        data['version'] = version;
        data['token'] = token;
        data['name'] = name;
        data['contactNumber'] = contactNumber;
        data['verified'] = verified;
        data['status'] = status;
        data['modifiedDate'] = modifiedDate;
        data['supplierID'] = supplierID;
        data['supplierName'] = supplierName;
        data['areaID'] = areaID;
        data['supplierEmail'] = supplierEmail;
        data['supplierContact'] = supplierContact;
        data['supplierCode'] = supplierCode;
        return data;
    }
}

