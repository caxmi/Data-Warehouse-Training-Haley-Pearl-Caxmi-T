Faculty Database CRUD Practice
1️.Switch to a new database called facultydb

use facultydb
switched to db facultydb

2️.Create a collection named professors and insert the following 3 professors:

db["professors"].find()
db.professors.insertMany([
  {
    name: "Dr. Kavita Iyer",
    subject: "Mathematics",
    experience: 10,
    active: true
  },
  {
    name: "Dr. Nikhil Sinha",
    subject: "Physics",
    experience: 5,
    active: false
  },
  {
    name: "Dr. Meera Das",
    subject: "Chemistry",
    experience: 8,
    active: true
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682c5b8a7c7639093825c8cc'),
    '1': ObjectId('682c5b8a7c7639093825c8cd'),
    '2': ObjectId('682c5b8a7c7639093825c8ce')
  }
}

3️.Find all professors in the professors collection

db.professors.find()
--Result
{
  _id: ObjectId('682c5b8a7c7639093825c8cc'),
  name: 'Dr. Kavita Iyer',
  subject: 'Mathematics',
  experience: 10,
  active: true
}
{
  _id: ObjectId('682c5b8a7c7639093825c8cd'),
  name: 'Dr. Nikhil Sinha',
  subject: 'Physics',
  experience: 5,
  active: false
}
{
  _id: ObjectId('682c5b8a7c7639093825c8ce'),
  name: 'Dr. Meera Das',
  subject: 'Chemistry',
  experience: 8,
  active: true
}

4️.Find only the professors who are active

db.professors.find({ active: true })
--Result
{
  _id: ObjectId('682c5b8a7c7639093825c8cc'),
  name: 'Dr. Kavita Iyer',
  subject: 'Mathematics',
  experience: 10,
  active: true
}
{
  _id: ObjectId('682c5b8a7c7639093825c8ce'),
  name: 'Dr. Meera Das',
  subject: 'Chemistry',
  experience: 8,
  active: true
}

5️.Update the experience of the "Physics" professor to 6 years

db.professors.updateOne(
  { subject: "Physics" },
  { $set: { experience: 6 } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

6️.Mark the "Physics" professor as active

db.professors.updateOne(
  { subject: "Physics" },
  { $set: { active: true } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

7️. Delete the professor who teaches "Chemistry"

db.professors.deleteOne({ subject: "Chemistry" })
--Result
{
  acknowledged: true,
  deletedCount: 1
}
