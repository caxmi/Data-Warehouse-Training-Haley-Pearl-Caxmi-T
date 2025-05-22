MongoDB Schema & Relationships Exercise Set-1
Section 2: One-to-One (Embedded)

1.Create a database schooldb 

Database-schooldb

2.In the students collection, insert 3 student documents with:

use schooldb
switched to db schooldb
db["students"].find()
db.students.insertMany([
  {
    name: "Haley",
    age: 14,
    grade: 9,
    guardian: {
      name: "Sophia",
      phone: "9876543210",
      relation: "Mother"
    }
  },
  {
    name: "Riya",
    age: 15,
    grade: 10,
    guardian: {
      name: "Rahul",
      phone: "9876501234",
      relation: "Father"
    }
  },
  {
    name: "Nilaa",
    age: 13,
    grade: 8,
    guardian: {
      name: "Meena",
      phone: "9876512345",
      relation: "Mother"
    }
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682f1ffb93f1578f24328aef'),
    '1': ObjectId('682f1ffb93f1578f24328af0'),
    '2': ObjectId('682f1ffb93f1578f24328af1')
  }
}

3.Query students where the guardian is their "Mother"

db.students.find({ "guardian.relation": "Mother" })
{
  _id: ObjectId('682f1ffb93f1578f24328aef'),
  name: 'Haley',
  age: 14,
  grade: 9,
  guardian: {
    name: 'Sophia',
    phone: '9876543210',
    relation: 'Mother'
  }
}
--Result
{
  _id: ObjectId('682f1ffb93f1578f24328af1'),
  name: 'Nilaa',
  age: 13,
  grade: 8,
  guardian: {
    name: 'Meena',
    phone: '9876512345',
    relation: 'Mother'
  }
}

4.Update the guardian's phone number for a specific student

db.students.updateOne(
  { name: "Riya" },
  { $set: { "guardian.phone": "9999999999" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
schooldb
