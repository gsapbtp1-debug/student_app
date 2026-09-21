namespace student.db;
using { cuid, managed } from '@sap/cds/common';

type nameType: String(50);

aspect customAspect{
    status:String;
}

entity Students:cuid,managed,customAspect {
    //key studentID : UUID;
        name      : nameType;
        address   : String;
        email     : String(50);
        mobile    : String;
        age       : Integer;
        gender    : String;
       
}

entity Courses : cuid, managed {
        name: nameType;
        cost: Decimal(10,2);
        trainer: String;
        duration: Integer;
}

entity Address  {
       key addressID: Integer;
        description: String;
        city: String;
        country: String;
        pincode: Integer;
}

entity Books: cuid{

    name :String;
    title: String;
    publishedDate: String;
    author:Association to Authors;//managed association
}

entity Authors: cuid{

    name :String;
    books: Composition of many Books on books.author=$self;
}