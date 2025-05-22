MongoDB Schema & Relationships Exercise Set-1
Section 4: One-to-Many (Referenced)

1.Create a database academia

use academia
switched to db academia
db["courses"].find()

2.Insert documents into courses with fields:

db.courses.insertMany([
  { _id: ObjectId("64f100000000000000000001"), title: "Machine Learning", credits: 4 },
  { _id: ObjectId("64f100000000000000000002"), title: "Database Systems", credits: 3 },
  { _id: ObjectId("64f100000000000000000003"), title: "Cloud Computing", credits: 3 }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('64f100000000000000000001'),
    '1': ObjectId('64f100000000000000000002'),
    '2': ObjectId('64f100000000000000000003')
  }
}

3.Insert documents into students with fields:

db.students.insertMany([
  { name: "Haley", enrolledCourse: ObjectId("64f100000000000000000001") },
  { name: "Riya", enrolledCourse: ObjectId("64f100000000000000000002") },
  { name: "Nilaa", enrolledCourse: ObjectId("64f100000000000000000001") }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682f2309ac868f8fe1c1bec4'),
    '1': ObjectId('682f2309ac868f8fe1c1bec5'),
    '2': ObjectId('682f2309ac868f8fe1c1bec6')
  }
}

4.Query students who are enrolled in a specific course (by ObjectId )

db.students.find({ enrolledCourse: ObjectId("64f100000000000000000001") })
--Result
{
  _id: ObjectId('682f2309ac868f8fe1c1bec4'),
  name: 'Haley',
  enrolledCourse: ObjectId('64f100000000000000000001')
}
{
  _id: ObjectId('682f2309ac868f8fe1c1bec6'),
  name: 'Nilaa',
  enrolledCourse: ObjectId('64f100000000000000000001')
}

5.Query the course details separately using the referenced _id 

db.courses.find({ _id: ObjectId("64f100000000000000000001") })
--Result
{
  _id: ObjectId('64f100000000000000000001'),
  title: 'Machine Learning',
  credits: 4
}
academia
