Command:
test> use student2

Output:
switched to db student2

Command:
student2> db.createCollection("student")

Output:
{ ok: 1 }

Command:
student2> db.students.insertMany([
  {
    name: "Rahul Sharma",
    age: 22,
    gender: "Male",
    department: "Computer Science",
    courses: [
      { name: "Python", score: 92 },
      { name: "MongoDB", score: 88 }
    ],
    address: {
      city: "Bangalore",
      state: "Karnataka",
      pincode: 560001
    },
    enrollmentDate: ISODate("2023-09-10T00:00:00Z"),
    isActive: true
  },
  {
    name: "Priya Kumar",
    age: 21,
    gender: "Female",
    department: "Mathematics",
    courses: [
      { name: "Python", score: 85 },
      { name: "Node.js", score: 90 }
    ],
    address: {
      city: "Mumbai",
      state: "Maharashtra",
      pincode: 400001
    },
    enrollmentDate: ISODate("2023-10-05T00:00:00Z"),
    isActive: true
  },
  {
    name: "Amit Verma",
    age: 23,
    gender: "Male",
    department: "Mechanical",
    courses: [
      { name: "Python", score: 75 },
      { name: "MongoDB", score: 80 }
    ],
    address: {
      city: "Delhi",
      state: "Delhi",
      pincode: 110002
    },
    enrollmentDate: ISODate("2023-08-15T00:00:00Z"),
    isActive: false
  },
  {
    name: "Sneha Aggarwal",
    age: 20,
    gender: "Female",
    department: "Computer Science",
    courses: [
      { name: "MongoDB", score: 90 },
      { name: "Node.js", score: 85 }
    ],
    address: {
      city: "Hyderabad",
      state: "Telangana",
      pincode: 500032
    },
    enrollmentDate: ISODate("2023-11-01T00:00:00Z"),
    isActive: true
  },
  {
    name: "Deepak Singh",
    age: 24,
    gender: "Male",
    department: "Mathematics",
    courses: [
      { name: "Python", score: 89 },
      { name: "MongoDB", score: 93 }
    ],
    address: {
      city: "Chennai",
      state: "Tamil Nadu",
      pincode: 600001
    },
    enrollmentDate: ISODate("2023-07-25T00:00:00Z"),
    isActive: true
  },
  {
    name: "Neha Patel",
    age: 22,
    gender: "Female",
    department: "Computer Science",
    courses: [
      { name: "Python", score: 95 },
      { name: "Node.js", score: 88 }
    ],
    address: {
      city: "Pune",
      state: "Maharashtra",
      pincode: 411001
    },
    enrollmentDate: ISODate("2023-06-20T00:00:00Z"),
    isActive: false
  },
  {
    name: "Manish Reddy",
    age: 23,
    gender: "Male",
    department: "Mathematics",
    courses: [
      { name: "MongoDB", score: 82 },
      { name: "Python", score: 87 }
    ],
    address: {
      city: "Hyderabad",
      state: "Telangana",
      pincode: 500045
    },
    enrollmentDate: ISODate("2023-12-01T00:00:00Z"),
    isActive: true
  },
  {
    name: "Ritu Gupta",
    age: 21,
    gender: "Female",
    department: "Mechanical",
    courses: [
      { name: "Node.js", score: 78 },
      { name: "Python", score: 80 }
    ],
    address: {
      city: "Jaipur",
      state: "Rajasthan",
      pincode: 302001
    },
    enrollmentDate: ISODate("2023-10-15T00:00:00Z"),
    isActive: true
  },
  {
    name: "Vikram Bhatia",
    age: 25,
    gender: "Male",
    department: "Computer Science",
    courses: [
      { name: "MongoDB", score: 92 },
      { name: "Python", score: 88 }
    ],
    address: {
      city: "Kolkata",
      state: "West Bengal",
      pincode: 700001
    },
    enrollmentDate: ISODate("2023-05-10T00:00:00Z"),
    isActive: false
  },
  {
    name: "Anjali Desai",
    age: 20,
    gender: "Female",
    department: "Mathematics",
    courses: [
      { name: "Python", score: 90 },
      { name: "Node.js", score: 84 }
    ],
    address: {
      city: "Ahmedabad",
      state: "Gujarat",
      pincode: 380001
    },
    enrollmentDate: ISODate("2023-09-20T00:00:00Z"),
    isActive: true
  },
  {
    name: "Sahil Mehra",
    age: 22,
    gender: "Male",
    department: "Computer Science",
    courses: [
      { name: "Node.js", score: 85 },
      { name: "MongoDB", score: 87 }
    ],
    address: {
      city: "Bangalore",
      state: "Karnataka",
      pincode: 560002
    },
    enrollmentDate: ISODate("2023-07-10T00:00:00Z"),
    isActive: true
  },
  {
    name: "Kiran Joshi",
    age: 21,
    gender: "Female",
    department: "Mathematics",
    courses: [
      { name: "Python", score: 84 },
      { name: "MongoDB", score: 79 }
    ],
    address: {
      city: "Lucknow",
      state: "Uttar Pradesh",
      pincode: 226001
    },
    enrollmentDate: ISODate("2023-06-15T00:00:00Z"),
    isActive: false
  },
  {
    name: "Tara Naidu",
    age: 23,
    gender: "Female",
    department: "Mechanical",
    courses: [
      { name: "MongoDB", score: 81 },
      { name: "Node.js", score: 77 }
    ],
    address: {
      city: "Chandigarh",
      state: "Punjab",
      pincode: 160001
    },
    enrollmentDate: ISODate("2023-08-05T00:00:00Z"),
    isActive: true
  },
  {
    name: "Suresh Iyer",
    age: 24,
    gender: "Male",
    department: "Computer Science",
    courses: [
      { name: "Python", score: 88 },
      { name: "MongoDB", score: 91 }
    ],
    address: {
      city: "Hyderabad",
      state: "Telangana",
      pincode: 500050
    },
    enrollmentDate: ISODate("2023-11-20T00:00:00Z"),
    isActive: true
  },
  {
    name: "Nidhi Rao",
    age: 22,
    gender: "Female",
    department: "Mathematics",
    courses: [
      { name: "Node.js", score: 80 },
      { name: "Python", score: 86 }
    ],
    address: {
      city: "Chennai",
      state: "Tamil Nadu",
      pincode: 600002
    },
    enrollmentDate: ISODate("2023-10-25T00:00:00Z"),
    isActive: false
  },
  {
    name: "Rajesh Khanna",
    age: 23,
    gender: "Male",
    department: "Computer Science",
    courses: [
      { name: "MongoDB", score: 93 },
      { name: "Node.js", score: 85 }
    ],
    address: {
      city: "Mumbai",
      state: "Maharashtra",
      pincode: 400002
    },
    enrollmentDate: ISODate("2023-09-30T00:00:00Z"),
    isActive: true
  },
  {
    name: "Rohini Chatterjee",
    age: 21,
    gender: "Female",
    department: "Mathematics",
    courses: [
      { name: "Python", score: 87 },
      { name: "MongoDB", score: 82 }
    ],
    address: {
      city: "Kolkata",
      state: "West Bengal",
      pincode: 700002
    },
    enrollmentDate: ISODate("2023-08-25T00:00:00Z"),
    isActive: true
  },
  {
    name: "Vijay Malhotra",
    age: 24,
    gender: "Male",
    department: "Computer Science",
    courses: [
      { name: "Python", score: 90 },
      { name: "MongoDB", score: 88 }
    ],
    address: {
      city: "Bangalore",
      state: "Karnataka",
      pincode: 560003
    },
    enrollmentDate: ISODate("2023-07-05T00:00:00Z"),
    isActive: false
  },
  {
    name: "Shruti Gill",
    age: 22,
    gender: "Female",
    department: "Mathematics",
    courses: [
      { name: "Node.js", score: 89 },
      { name: "Python", score: 91 }
    ],
    address: {
      city: "Delhi",
      state: "Delhi",
      pincode: 110003
    },
    enrollmentDate: ISODate("2023-06-30T00:00:00Z"),
    isActive: true
  },
  {
    name: "Aishwarya Narayan",
    age: 23,
    gender: "Female",
    department: "Mechanical",
    courses: [
      { name: "MongoDB", score: 77 },
      { name: "Node.js", score: 81 }
    ],
    address: {
      city: "Hyderabad",
      state: "Telangana",
      pincode: 500060
    },
    enrollmentDate: ISODate("2023-05-25T00:00:00Z"),
    isActive: true
  }
]);

Output:
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6833f8340ca45f0f696c4bd0'),
    '1': ObjectId('6833f8340ca45f0f696c4bd1'),
    '2': ObjectId('6833f8340ca45f0f696c4bd2'),
    '3': ObjectId('6833f8340ca45f0f696c4bd3'),
    '4': ObjectId('6833f8340ca45f0f696c4bd4'),
    '5': ObjectId('6833f8340ca45f0f696c4bd5'),
    '6': ObjectId('6833f8340ca45f0f696c4bd6'),
    '7': ObjectId('6833f8340ca45f0f696c4bd7'),
    '8': ObjectId('6833f8340ca45f0f696c4bd8'),
    '9': ObjectId('6833f8340ca45f0f696c4bd9'),
    '10': ObjectId('6833f8340ca45f0f696c4bda'),
    '11': ObjectId('6833f8340ca45f0f696c4bdb'),
    '12': ObjectId('6833f8340ca45f0f696c4bdc'),
    '13': ObjectId('6833f8340ca45f0f696c4bdd'),
    '14': ObjectId('6833f8340ca45f0f696c4bde'),
    '15': ObjectId('6833f8340ca45f0f696c4bdf'),
    '16': ObjectId('6833f8340ca45f0f696c4be0'),
    '17': ObjectId('6833f8340ca45f0f696c4be1'),
    '18': ObjectId('6833f8340ca45f0f696c4be2'),
    '19': ObjectId('6833f8340ca45f0f696c4be3')
  }
}

CRUD Operations

1. Insert a new student record with embedded courses and address data.

Command:
student2> db.students.insertOne({
...   name: "Arjun Verma",
...   age: 22,
...   gender: "Male",
...   department: "Computer Science",
...   courses: [
...     { name: "Python", score: 88 },
...     { name: "MongoDB", score: 90 }
...   ],
...   address: {
...     city: "Bangalore",
...     state: "Karnataka",
...     pincode: 560002
...   },
...   enrollmentDate: ISODate("2024-08-10T00:00:00Z"),
...   isActive: true
... });

Output:
{
  acknowledged: true,
  insertedId: ObjectId('6833f84b0ca45f0f696c4be4')
}

2. Update score for a course ( Python ) inside the courses array.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan", "courses.name": "Python" },
...   { $set: { "courses.$.score": 95 } }
... );

Output:
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}

3. Delete a student whose name is "John Doe" .

Command:
student2> db.students.deleteOne({ name: "John Doe" });

Output:
{ acknowledged: true, deletedCount: 0 }

4. Find all students in the "Computer Science" department.

Command:
student2> db.students.find({ department: "Computer Science" });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]



Query Operators

5. Find students where age is greater than 20.

Command:
student2> db.students.find({ age: { $gt: 20 } });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 85 }, { name: 'Node.js', score: 90 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400001 },
    enrollmentDate: ISODate('2023-10-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd2'),
    name: 'Amit Verma',
    age: 23,
    gender: 'Male',
    department: 'Mechanical',
    courses: [ { name: 'Python', score: 75 }, { name: 'MongoDB', score: 80 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110002 },
    enrollmentDate: ISODate('2023-08-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600001 },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd7'),
    name: 'Ritu Gupta',
    age: 21,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'Node.js', score: 78 }, { name: 'Python', score: 80 } ],
    address: { city: 'Jaipur', state: 'Rajasthan', pincode: 302001 },
    enrollmentDate: ISODate('2023-10-15T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: { city: 'Lucknow', state: 'Uttar Pradesh', pincode: 226001 },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdc'),
    name: 'Tara Naidu',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 81 }, { name: 'Node.js', score: 77 } ],
    address: { city: 'Chandigarh', state: 'Punjab', pincode: 160001 },
    enrollmentDate: ISODate('2023-08-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 80 }, { name: 'Python', score: 86 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600002 },
    enrollmentDate: ISODate('2023-10-25T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700002 },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 89 }, { name: 'Python', score: 91 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110003 },
    enrollmentDate: ISODate('2023-06-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be3'),
    name: 'Aishwarya Narayan',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 77 }, { name: 'Node.js', score: 81 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500060 },
    enrollmentDate: ISODate('2023-05-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]

6. Find students enrolled between two dates.

Command:
student2> db.students.find({
...   enrollmentDate: {
...     $gte: ISODate("2023-01-01T00:00:00Z"),
...     $lte: ISODate("2024-01-01T00:00:00Z")
...   }
... });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 85 }, { name: 'Node.js', score: 90 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400001 },
    enrollmentDate: ISODate('2023-10-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd2'),
    name: 'Amit Verma',
    age: 23,
    gender: 'Male',
    department: 'Mechanical',
    courses: [ { name: 'Python', score: 75 }, { name: 'MongoDB', score: 80 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110002 },
    enrollmentDate: ISODate('2023-08-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600001 },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd7'),
    name: 'Ritu Gupta',
    age: 21,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'Node.js', score: 78 }, { name: 'Python', score: 80 } ],
    address: { city: 'Jaipur', state: 'Rajasthan', pincode: 302001 },
    enrollmentDate: ISODate('2023-10-15T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd9'),
    name: 'Anjali Desai',
    age: 20,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 90 }, { name: 'Node.js', score: 84 } ],
    address: { city: 'Ahmedabad', state: 'Gujarat', pincode: 380001 },
    enrollmentDate: ISODate('2023-09-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: { city: 'Lucknow', state: 'Uttar Pradesh', pincode: 226001 },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdc'),
    name: 'Tara Naidu',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 81 }, { name: 'Node.js', score: 77 } ],
    address: { city: 'Chandigarh', state: 'Punjab', pincode: 160001 },
    enrollmentDate: ISODate('2023-08-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 80 }, { name: 'Python', score: 86 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600002 },
    enrollmentDate: ISODate('2023-10-25T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700002 },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 89 }, { name: 'Python', score: 91 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110003 },
    enrollmentDate: ISODate('2023-06-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be3'),
    name: 'Aishwarya Narayan',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 77 }, { name: 'Node.js', score: 81 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500060 },
    enrollmentDate: ISODate('2023-05-25T00:00:00.000Z'),
    isActive: true
  }
]

7. Find students who are either in "Computer Science" or "Mathematics".

Command:
student2> db.students.find({
...   department: { $in: ["Computer Science", "Mathematics"] }
... });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 85 }, { name: 'Node.js', score: 90 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400001 },
    enrollmentDate: ISODate('2023-10-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600001 },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd9'),
    name: 'Anjali Desai',
    age: 20,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 90 }, { name: 'Node.js', score: 84 } ],
    address: { city: 'Ahmedabad', state: 'Gujarat', pincode: 380001 },
    enrollmentDate: ISODate('2023-09-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: { city: 'Lucknow', state: 'Uttar Pradesh', pincode: 226001 },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 80 }, { name: 'Python', score: 86 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600002 },
    enrollmentDate: ISODate('2023-10-25T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700002 },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 89 }, { name: 'Python', score: 91 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110003 },
    enrollmentDate: ISODate('2023-06-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]

8. Find students not in the "Mechanical" department.

Command:
student2> db.students.find({
...   department: { $ne: "Mechanical" }
... });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 85 }, { name: 'Node.js', score: 90 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400001 },
    enrollmentDate: ISODate('2023-10-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600001 },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd9'),
    name: 'Anjali Desai',
    age: 20,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 90 }, { name: 'Node.js', score: 84 } ],
    address: { city: 'Ahmedabad', state: 'Gujarat', pincode: 380001 },
    enrollmentDate: ISODate('2023-09-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: { city: 'Lucknow', state: 'Uttar Pradesh', pincode: 226001 },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 80 }, { name: 'Python', score: 86 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600002 },
    enrollmentDate: ISODate('2023-10-25T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700002 },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 89 }, { name: 'Python', score: 91 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110003 },
    enrollmentDate: ISODate('2023-06-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]


9. Find students whose courses.score is greater than 80.

Command:
student2> db.students.find({
...   "courses.score": { $gt: 80 }
... });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 85 }, { name: 'Node.js', score: 90 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400001 },
    enrollmentDate: ISODate('2023-10-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600001 },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd9'),
    name: 'Anjali Desai',
    age: 20,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 90 }, { name: 'Node.js', score: 84 } ],
    address: { city: 'Ahmedabad', state: 'Gujarat', pincode: 380001 },
    enrollmentDate: ISODate('2023-09-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: { city: 'Lucknow', state: 'Uttar Pradesh', pincode: 226001 },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdc'),
    name: 'Tara Naidu',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 81 }, { name: 'Node.js', score: 77 } ],
    address: { city: 'Chandigarh', state: 'Punjab', pincode: 160001 },
    enrollmentDate: ISODate('2023-08-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 80 }, { name: 'Python', score: 86 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600002 },
    enrollmentDate: ISODate('2023-10-25T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700002 },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 89 }, { name: 'Python', score: 91 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110003 },
    enrollmentDate: ISODate('2023-06-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be3'),
    name: 'Aishwarya Narayan',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 77 }, { name: 'Node.js', score: 81 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500060 },
    enrollmentDate: ISODate('2023-05-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]

Aggregation Framework

10. Group by department and count students.

Command:
student2> db.students.aggregate([
...   { $group: { _id: "$department", studentCount: { $sum: 1 } } }
... ]);

Output:
[
  { _id: 'Mechanical', studentCount: 4 },
  { _id: 'Mathematics', studentCount: 8 },
  { _id: 'Computer Science', studentCount: 9 }
]

11. Calculate average age of students per department.

Command:
student2> db.students.aggregate([
...   { $group: { _id: "$department", averageAge: { $avg: "$age" } } }
... ]);

Output:
[
  { _id: 'Mechanical', averageAge: 22.5 },
  { _id: 'Computer Science', averageAge: 22.666666666666668 },
  { _id: 'Mathematics', averageAge: 21.75 }
]

12. Sort students by total course score (computed using $sum inside $project ).

Command:
student2> db.students.aggregate([
...   {
...     $project: {
...       name: 1,
...       totalScore: { $sum: "$courses.score" }
...     }
...   },
...   { $sort: { totalScore: -1 } }
... ]);

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    totalScore: 183
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    totalScore: 182
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    totalScore: 180
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    totalScore: 180
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    totalScore: 180
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    totalScore: 179
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    totalScore: 178
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    totalScore: 178
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    totalScore: 178
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    totalScore: 175
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    totalScore: 175
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd9'),
    name: 'Anjali Desai',
    totalScore: 174
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    totalScore: 172
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    totalScore: 169
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    totalScore: 169
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    totalScore: 166
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    totalScore: 163
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd7'),
    name: 'Ritu Gupta',
    totalScore: 158
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdc'),
    name: 'Tara Naidu',
    totalScore: 158
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be3'),
    name: 'Aishwarya Narayan',
    totalScore: 158
  }
]

13. Filter only active students before aggregation.

Command:
student2> db.students.aggregate([
...   { $match: { isActive: true } },
...   { $group: { _id: "$department", count: { $sum: 1 } } }
... ]);

Output:
[
  { _id: 'Computer Science', count: 6 },
  { _id: 'Mathematics', count: 6 },
  { _id: 'Mechanical', count: 3 }
]


14. Group and list unique cities from the address field.

Command:
student2> db.students.aggregate([
...   {
...     $group: {
...       _id: null,
...       uniqueCities: { $addToSet: "$address.city" }
...     }
...   }
... ]);

Output:
[
  {
    _id: null,
    uniqueCities: [
      'Chennai',    'Mumbai',
      'Jaipur',     'Pune',
      'Chandigarh', 'Delhi',
      'Bangalore',  'Hyderabad',
      'Kolkata',    'Lucknow',
      'Ahmedabad'
    ]
  }
]

Projections

15. Find students with only name , department , and city fields shown.

Command:
student2> db.students.find({}, {
...   name: 1,
...   department: 1,
...   "address.city": 1,
...   _id: 0
... });

Output:
[
  {
    name: 'Rahul Sharma',
    department: 'Computer Science',
    address: { city: 'Bangalore' }
  },
  {
    name: 'Priya Kumar',
    department: 'Mathematics',
    address: { city: 'Mumbai' }
  },
  {
    name: 'Amit Verma',
    department: 'Mechanical',
    address: { city: 'Delhi' }
  },
  {
    name: 'Sneha Aggarwal',
    department: 'Computer Science',
    address: { city: 'Hyderabad' }
  },
  {
    name: 'Deepak Singh',
    department: 'Mathematics',
    address: { city: 'Chennai' }
  },
  {
    name: 'Neha Patel',
    department: 'Computer Science',
    address: { city: 'Pune' }
  },
  {
    name: 'Manish Reddy',
    department: 'Mathematics',
    address: { city: 'Hyderabad' }
  },
  {
    name: 'Ritu Gupta',
    department: 'Mechanical',
    address: { city: 'Jaipur' }
  },
  {
    name: 'Vikram Bhatia',
    department: 'Computer Science',
    address: { city: 'Kolkata' }
  },
  {
    name: 'Anjali Desai',
    department: 'Mathematics',
    address: { city: 'Ahmedabad' }
  },
  {
    name: 'Sahil Mehra',
    department: 'Computer Science',
    address: { city: 'Bangalore' }
  },
  {
    name: 'Kiran Joshi',
    department: 'Mathematics',
    address: { city: 'Lucknow' }
  },
  {
    name: 'Tara Naidu',
    department: 'Mechanical',
    address: { city: 'Chandigarh' }
  },
  {
    name: 'Suresh Iyer',
    department: 'Computer Science',
    address: { city: 'Hyderabad' }
  },
  {
    name: 'Nidhi Rao',
    department: 'Mathematics',
    address: { city: 'Chennai' }
  },
  {
    name: 'Rajesh Khanna',
    department: 'Computer Science',
    address: { city: 'Mumbai' }
  },
  {
    name: 'Rohini Chatterjee',
    department: 'Mathematics',
    address: { city: 'Kolkata' }
  },
  {
    name: 'Vijay Malhotra',
    department: 'Computer Science',
    address: { city: 'Bangalore' }
  },
  {
    name: 'Shruti Gill',
    department: 'Mathematics',
    address: { city: 'Delhi' }
  },
  {
    name: 'Aishwarya Narayan',
    department: 'Mechanical',
    address: { city: 'Hyderabad' }
  }
]

16. Exclude the _id field from output.

Command:
student2> db.students.find({}, { _id: 0 });

Output:
[
  {
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560001 },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Priya Kumar',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 85 }, { name: 'Node.js', score: 90 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400001 },
    enrollmentDate: ISODate('2023-10-05T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Amit Verma',
    age: 23,
    gender: 'Male',
    department: 'Mechanical',
    courses: [ { name: 'Python', score: 75 }, { name: 'MongoDB', score: 80 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110002 },
    enrollmentDate: ISODate('2023-08-15T00:00:00.000Z'),
    isActive: false
  },
  {
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600001 },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Neha Patel',
    age: 22,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 95 }, { name: 'Node.js', score: 88 } ],
    address: { city: 'Pune', state: 'Maharashtra', pincode: 411001 },
    enrollmentDate: ISODate('2023-06-20T00:00:00.000Z'),
    isActive: false
  },
  {
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Ritu Gupta',
    age: 21,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'Node.js', score: 78 }, { name: 'Python', score: 80 } ],
    address: { city: 'Jaipur', state: 'Rajasthan', pincode: 302001 },
    enrollmentDate: ISODate('2023-10-15T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700001 },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    name: 'Anjali Desai',
    age: 20,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 90 }, { name: 'Node.js', score: 84 } ],
    address: { city: 'Ahmedabad', state: 'Gujarat', pincode: 380001 },
    enrollmentDate: ISODate('2023-09-20T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560002 },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: { city: 'Lucknow', state: 'Uttar Pradesh', pincode: 226001 },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    name: 'Tara Naidu',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 81 }, { name: 'Node.js', score: 77 } ],
    address: { city: 'Chandigarh', state: 'Punjab', pincode: 160001 },
    enrollmentDate: ISODate('2023-08-05T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Nidhi Rao',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 80 }, { name: 'Python', score: 86 } ],
    address: { city: 'Chennai', state: 'Tamil Nadu', pincode: 600002 },
    enrollmentDate: ISODate('2023-10-25T00:00:00.000Z'),
    isActive: false
  },
  {
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Mumbai', state: 'Maharashtra', pincode: 400002 },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: { city: 'Kolkata', state: 'West Bengal', pincode: 700002 },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: { city: 'Bangalore', state: 'Karnataka', pincode: 560003 },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    name: 'Shruti Gill',
    age: 22,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Node.js', score: 89 }, { name: 'Python', score: 91 } ],
    address: { city: 'Delhi', state: 'Delhi', pincode: 110003 },
    enrollmentDate: ISODate('2023-06-30T00:00:00.000Z'),
    isActive: true
  },
  {
    name: 'Aishwarya Narayan',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 77 }, { name: 'Node.js', score: 81 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500060 },
    enrollmentDate: ISODate('2023-05-25T00:00:00.000Z'),
    isActive: true
  }
]

17. Show each student's name and total score using $project .

Command:
student2> db.students.aggregate([
...   {
...     $project: {
...       name: 1,
...       totalScore: { $sum: "$courses.score" }
...     }
...   }
... ]);


Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    totalScore: 180
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd1'),
    name: 'Priya Kumar',
    totalScore: 175
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd2'),
    name: 'Amit Verma',
    totalScore: 155
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    totalScore: 175
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    totalScore: 182
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd5'),
    name: 'Neha Patel',
    totalScore: 183
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    totalScore: 169
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd7'),
    name: 'Ritu Gupta',
    totalScore: 158
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    totalScore: 180
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd9'),
    name: 'Anjali Desai',
    totalScore: 174
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    totalScore: 172
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    totalScore: 163
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdc'),
    name: 'Tara Naidu',
    totalScore: 158
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    totalScore: 179
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bde'),
    name: 'Nidhi Rao',
    totalScore: 166
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    totalScore: 178
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    totalScore: 169
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    totalScore: 178
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be2'),
    name: 'Shruti Gill',
    totalScore: 180
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be3'),
    name: 'Aishwarya Narayan',
    totalScore: 158
  }
]

Embedded Documents

18. Query students where address.city = "Hyderabad" .

Command:
student2> db.students.find({ "address.city": "Hyderabad" });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500032 },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500045 },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500050 },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be3'),
    name: 'Aishwarya Narayan',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 77 }, { name: 'Node.js', score: 81 } ],
    address: { city: 'Hyderabad', state: 'Telangana', pincode: 500060 },
    enrollmentDate: ISODate('2023-05-25T00:00:00.000Z'),
    isActive: true
  }
]

19. Update address.pincode for a student.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan" },
...   { $set: { "address.pincode": 500100 } }
... );

Output:
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}

20. Add a new field landmark to all address objects.

Command:
student2> db.students.updateMany(
...   {},
...   { $set: { "address.landmark": "Near Main Road" } }
... );

Output:
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 21,
  modifiedCount: 21,
  upsertedCount: 0
}

Array Operations

21. Add a new course "Node.js" to a student's courses array.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan" },
...   { $push: { courses: { name: "Node.js", score: 89 } } }
... );

Output:
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}

22. Remove a course by name "MongoDB" from the array.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan" },
...   { $pull: { courses: { name: "MongoDB" } } }
... );

Output:
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 0,
  modifiedCount: 0,
  upsertedCount: 0
}

23. Find students who have enrolled in both Python and MongoDB.

Command:
student2> db.students.find({
...   "courses.name": { $all: ["Python", "MongoDB"] }
... });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd2'),
    name: 'Amit Verma',
    age: 23,
    gender: 'Male',
    department: 'Mechanical',
    courses: [ { name: 'Python', score: 75 }, { name: 'MongoDB', score: 80 } ],
    address: {
      city: 'Delhi',
      state: 'Delhi',
      pincode: 110002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-08-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: {
      city: 'Chennai',
      state: 'Tamil Nadu',
      pincode: 600001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: {
      city: 'Hyderabad',
      state: 'Telangana',
      pincode: 500045,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: {
      city: 'Kolkata',
      state: 'West Bengal',
      pincode: 700001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdb'),
    name: 'Kiran Joshi',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 84 }, { name: 'MongoDB', score: 79 } ],
    address: {
      city: 'Lucknow',
      state: 'Uttar Pradesh',
      pincode: 226001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-06-15T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: {
      city: 'Hyderabad',
      state: 'Telangana',
      pincode: 500050,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: {
      city: 'Kolkata',
      state: 'West Bengal',
      pincode: 700002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560003,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]

24. Use $elemMatch to query students where score in MongoDB > 80.

Command:
student2> db.students.find({
...   courses: { $elemMatch: { name: "MongoDB", score: { $gt: 80 } } }
... });

Output:
[
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd0'),
    name: 'Rahul Sharma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 92 }, { name: 'MongoDB', score: 88 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-09-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd3'),
    name: 'Sneha Aggarwal',
    age: 20,
    gender: 'Female',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 90 }, { name: 'Node.js', score: 85 } ],
    address: {
      city: 'Hyderabad',
      state: 'Telangana',
      pincode: 500032,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-11-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd4'),
    name: 'Deepak Singh',
    age: 24,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 89 }, { name: 'MongoDB', score: 93 } ],
    address: {
      city: 'Chennai',
      state: 'Tamil Nadu',
      pincode: 600001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-07-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd6'),
    name: 'Manish Reddy',
    age: 23,
    gender: 'Male',
    department: 'Mathematics',
    courses: [ { name: 'MongoDB', score: 82 }, { name: 'Python', score: 87 } ],
    address: {
      city: 'Hyderabad',
      state: 'Telangana',
      pincode: 500045,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-12-01T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bd8'),
    name: 'Vikram Bhatia',
    age: 25,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 92 }, { name: 'Python', score: 88 } ],
    address: {
      city: 'Kolkata',
      state: 'West Bengal',
      pincode: 700001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-05-10T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bda'),
    name: 'Sahil Mehra',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Node.js', score: 85 }, { name: 'MongoDB', score: 87 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-07-10T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdc'),
    name: 'Tara Naidu',
    age: 23,
    gender: 'Female',
    department: 'Mechanical',
    courses: [ { name: 'MongoDB', score: 81 }, { name: 'Node.js', score: 77 } ],
    address: {
      city: 'Chandigarh',
      state: 'Punjab',
      pincode: 160001,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-08-05T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdd'),
    name: 'Suresh Iyer',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 91 } ],
    address: {
      city: 'Hyderabad',
      state: 'Telangana',
      pincode: 500050,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-11-20T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4bdf'),
    name: 'Rajesh Khanna',
    age: 23,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'MongoDB', score: 93 }, { name: 'Node.js', score: 85 } ],
    address: {
      city: 'Mumbai',
      state: 'Maharashtra',
      pincode: 400002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-09-30T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be0'),
    name: 'Rohini Chatterjee',
    age: 21,
    gender: 'Female',
    department: 'Mathematics',
    courses: [ { name: 'Python', score: 87 }, { name: 'MongoDB', score: 82 } ],
    address: {
      city: 'Kolkata',
      state: 'West Bengal',
      pincode: 700002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-08-25T00:00:00.000Z'),
    isActive: true
  },
  {
    _id: ObjectId('6833f8340ca45f0f696c4be1'),
    name: 'Vijay Malhotra',
    age: 24,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 90 }, { name: 'MongoDB', score: 88 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560003,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2023-07-05T00:00:00.000Z'),
    isActive: false
  },
  {
    _id: ObjectId('6833f84b0ca45f0f696c4be4'),
    name: 'Arjun Verma',
    age: 22,
    gender: 'Male',
    department: 'Computer Science',
    courses: [ { name: 'Python', score: 88 }, { name: 'MongoDB', score: 90 } ],
    address: {
      city: 'Bangalore',
      state: 'Karnataka',
      pincode: 560002,
      landmark: 'Near Main Road'
    },
    enrollmentDate: ISODate('2024-08-10T00:00:00.000Z'),
    isActive: true
  }
]