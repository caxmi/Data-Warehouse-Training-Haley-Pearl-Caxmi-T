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


2. Update score for a course ( Python ) inside the courses array.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan", "courses.name": "Python" },
...   { $set: { "courses.$.score": 95 } }
... );


3. Delete a student whose name is "John Doe" .

Command:
student2> db.students.deleteOne({ name: "John Doe" });

4. Find all students in the "Computer Science" department.

Command:
student2> db.students.find({ department: "Computer Science" });



Query Operators

5. Find students where age is greater than 20.

Command:
student2> db.students.find({ age: { $gt: 20 } });



6. Find students enrolled between two dates.

Command:
student2> db.students.find({
...   enrollmentDate: {
...     $gte: ISODate("2023-01-01T00:00:00Z"),
...     $lte: ISODate("2024-01-01T00:00:00Z")
...   }
... });


7. Find students who are either in "Computer Science" or "Mathematics".

Command:
student2> db.students.find({
...   department: { $in: ["Computer Science", "Mathematics"] }
... });


8. Find students not in the "Mechanical" department.

Command:
student2> db.students.find({
...   department: { $ne: "Mechanical" }
... });


9. Find students whose courses.score is greater than 80.

Command:
student2> db.students.find({
...   "courses.score": { $gt: 80 }
... });



Aggregation Framework

10. Group by department and count students.

Command:
student2> db.students.aggregate([
...   { $group: { _id: "$department", studentCount: { $sum: 1 } } }
... ]);


11. Calculate average age of students per department.

Command:
student2> db.students.aggregate([
...   { $group: { _id: "$department", averageAge: { $avg: "$age" } } }
... ]);


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


13. Filter only active students before aggregation.

Command:
student2> db.students.aggregate([
...   { $match: { isActive: true } },
...   { $group: { _id: "$department", count: { $sum: 1 } } }
... ]);


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



Projections

15. Find students with only name , department , and city fields shown.

Command:
student2> db.students.find({}, {
...   name: 1,
...   department: 1,
...   "address.city": 1,
...   _id: 0
... });


16. Exclude the _id field from output.

Command:
student2> db.students.find({}, { _id: 0 });


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



Embedded Documents

18. Query students where address.city = "Hyderabad" .

Command:
student2> db.students.find({ "address.city": "Hyderabad" });


19. Update address.pincode for a student.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan" },
...   { $set: { "address.pincode": 500100 } }
... );


20. Add a new field landmark to all address objects.

Command:
student2> db.students.updateMany(
...   {},
...   { $set: { "address.landmark": "Near Main Road" } }
... );



Array Operations

21. Add a new course "Node.js" to a student's courses array.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan" },
...   { $push: { courses: { name: "Node.js", score: 89 } } }
... );


22. Remove a course by name "MongoDB" from the array.

Command:
student2> db.students.updateOne(
...   { name: "Ayaan Khan" },
...   { $pull: { courses: { name: "MongoDB" } } }
... );


23. Find students who have enrolled in both Python and MongoDB.

Command:
student2> db.students.find({
...   "courses.name": { $all: ["Python", "MongoDB"] }
... });


24. Use $elemMatch to query students where score in MongoDB > 80.

Command:
student2> db.students.find({
...   courses: { $elemMatch: { name: "MongoDB", score: { $gt: 80 } } }
... });

