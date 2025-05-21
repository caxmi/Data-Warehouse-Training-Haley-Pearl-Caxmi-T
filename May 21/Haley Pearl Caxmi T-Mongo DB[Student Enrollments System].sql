Student Enrollments System

1.Use a new database called campusdb

use campusdb
switched to db campusdb
db["enrollments"].find()

2.Create a collection enrollments and insert 4 student documents. 

db.enrollments.insertMany([
  {
    name: "Ananya Verma",
    studentId: 101,
    courses: ["Python", "Java"],
    address: { city: "Delhi", state: "Delhi" },
    feesPaid: true
  },
  {
    name: "Rohan Mehta",
    studentId: 102,
    courses: ["Python", "AI"],
    address: { city: "Bangalore", state: "Karnataka" },
    feesPaid: false
  },
  {
    name: "Sneha Kapoor",
    studentId: 103,
    courses: [],
    address: { city: "Hyderabad", state: "Telangana" },
    feesPaid: true
  },
  {
    name: "Imran Shaikh",
    studentId: 104,
    courses: ["Data Science", "Java"],
    address: { city: "Delhi", state: "Delhi" },
    feesPaid: false
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682d505c2ee1572e07f3195a'),
    '1': ObjectId('682d505c2ee1572e07f3195b'),
    '2': ObjectId('682d505c2ee1572e07f3195c'),
    '3': ObjectId('682d505c2ee1572e07f3195d')
  }
}

3.Display all student records

db.enrollments.find()
--Result
{
  _id: ObjectId('682d505c2ee1572e07f3195a'),
  name: 'Ananya Verma',
  studentId: 101,
  courses: [
    'Python',
    'Java'
  ],
  address: {
    city: 'Delhi',
    state: 'Delhi'
  },
  feesPaid: true
}
{
  _id: ObjectId('682d505c2ee1572e07f3195b'),
  name: 'Rohan Mehta',
  studentId: 102,
  courses: [
    'Python',
    'AI'
  ],
  address: {
    city: 'Bangalore',
    state: 'Karnataka'
  },
  feesPaid: false
}
{
  _id: ObjectId('682d505c2ee1572e07f3195c'),
  name: 'Sneha Kapoor',
  studentId: 103,
  courses: [],
  address: {
    city: 'Hyderabad',
    state: 'Telangana'
  },
  feesPaid: true
}
{
  _id: ObjectId('682d505c2ee1572e07f3195d'),
  name: 'Imran Shaikh',
  studentId: 104,
  courses: [
    'Data Science',
    'Java'
  ],
  address: {
    city: 'Delhi',
    state: 'Delhi'
  },
  feesPaid: false
}

4.Find all students enrolled in "Python"

db.enrollments.find({ courses: "Python" })
--Result
{
  _id: ObjectId('682d505c2ee1572e07f3195a'),
  name: 'Ananya Verma',
  studentId: 101,
  courses: [
    'Python',
    'Java'
  ],
  address: {
    city: 'Delhi',
    state: 'Delhi'
  },
  feesPaid: true
}
{
  _id: ObjectId('682d505c2ee1572e07f3195b'),
  name: 'Rohan Mehta',
  studentId: 102,
  courses: [
    'Python',
    'AI'
  ],
  address: {
    city: 'Bangalore',
    state: 'Karnataka'
  },
  feesPaid: false
}

5.Find students from Delhi who have not paid fees

db.enrollments.find({ "address.city": "Delhi", feesPaid: false })
--Result
{
  _id: ObjectId('682d505c2ee1572e07f3195d'),
  name: 'Imran Shaikh',
  studentId: 104,
  courses: [
    'Data Science',
    'Java'
  ],
  address: {
    city: 'Delhi',
    state: 'Delhi'
  },
  feesPaid: false
}

6.Add a new course "AI Fundamentals" to a specific student's courses
array

db.enrollments.updateOne(
  { studentId: 101 },
  { $push: { courses: "AI Fundamentals" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

7.Update the city of a specific student to "Mumbai"

db.enrollments.updateOne(
  { studentId: 103 },
  { $set: { "address.city": "Mumbai" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

8.Set feesPaid to true for all students from "Delhi"

db.enrollments.updateMany(
  { "address.city": "Delhi" },
  { $set: { feesPaid: true } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 2,
  modifiedCount: 1,
  upsertedCount: 0
}

9.Remove "Java" course from any student who has it

db.enrollments.updateMany(
  { courses: "Java" },
  { $pull: { courses: "Java" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

10.Delete all students who have no courses enrolled (i.e., courses: [] )

db.enrollments.deleteMany({ courses: { $size: 0 } })
--Result
{
  acknowledged: true,
  deletedCount: 1
}

--Check db
db.enrollments.find()
{
  _id: ObjectId('682d505c2ee1572e07f3195a'),
  name: 'Ananya Verma',
  studentId: 101,
  courses: 'AI Fundamentals',
  address: {
    city: 'Delhi',
    state: 'Delhi'
  },
  feesPaid: true
}
{
  _id: ObjectId('682d505c2ee1572e07f3195b'),
  name: 'Rohan Mehta',
  studentId: 102,
  courses: [
    'Python',
    'AI'
  ],
  address: {
    city: 'Bangalore',
    state: 'Karnataka'
  },
  feesPaid: false
}
{
  _id: ObjectId('682d505c2ee1572e07f3195d'),
  name: 'Imran Shaikh',
  studentId: 104,
  courses: [
    'Data Science'
  ],
  address: {
    city: 'Delhi',
    state: 'Delhi'
  },
  feesPaid: true
}
campusdb