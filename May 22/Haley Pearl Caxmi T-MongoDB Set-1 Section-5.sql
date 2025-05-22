MongoDB Schema & Relationships Exercise Set
Section 5: $lookup (Join in Aggregation)

1.Use the academia database

use academia
switched to db academia

2.Use $lookup to join students with courses based on enrolledCourse

db.students.aggregate([
  {
    $lookup: {
      from: "courses",
      localField: "enrolledCourse",
      foreignField: "_id",
      as: "courseDetails"
    }
  }
])
--Result
{
  _id: ObjectId('682f2309ac868f8fe1c1bec4'),
  name: 'Haley',
  enrolledCourse: ObjectId('64f100000000000000000001'),
  courseDetails: [
    {
      _id: ObjectId('64f100000000000000000001'),
      title: 'Machine Learning',
      credits: 4
    }
  ]
}
{
  _id: ObjectId('682f2309ac868f8fe1c1bec5'),
  name: 'Riya',
  enrolledCourse: ObjectId('64f100000000000000000002'),
  courseDetails: [
    {
      _id: ObjectId('64f100000000000000000002'),
      title: 'Database Systems',
      credits: 3
    }
  ]
}
{
  _id: ObjectId('682f2309ac868f8fe1c1bec6'),
  name: 'Nilaa',
  enrolledCourse: ObjectId('64f100000000000000000001'),
  courseDetails: [
    {
      _id: ObjectId('64f100000000000000000001'),
      title: 'Machine Learning',
      credits: 4
    }
  ]
}

3.Show only student name , and course title in the output using $project

db.students.aggregate([
  {
    $lookup: {
      from: "courses",
      localField: "enrolledCourse",
      foreignField: "_id",
      as: "courseDetails"
    }
  },
  {
    $project: {
      _id: 0,
      name: 1,
      course: { $arrayElemAt: ["$courseDetails.title", 0] }
    }
  }
])
--Result
{
  name: 'Haley',
  course: 'Machine Learning'
}
{
  name: 'Riya',
  course: 'Database Systems'
}
{
  name: 'Nilaa',
  course: 'Machine Learning'
}

4.Add a $match after $lookup to get only students enrolled in "Machine Learning" course

db.students.aggregate([
  {
    $lookup: {
      from: "courses",
      localField: "enrolledCourse",
      foreignField: "_id",
      as: "courseDetails"
    }
  },
  { $unwind: "$courseDetails" },
  { $match: { "courseDetails.title": "Machine Learning" } },
  {
    $project: {
      _id: 0,
      name: 1,
      course: "$courseDetails.title"
    }
  }
])
--Result
{
  name: 'Haley',
  course: 'Machine Learning'
}
{
  name: 'Nilaa',
  course: 'Machine Learning'
}
academia