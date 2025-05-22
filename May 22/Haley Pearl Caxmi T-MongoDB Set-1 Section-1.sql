MongoDB Schema & Relationships Exercise Set
Section 1: Working with Schemas & Data Types


1.Create a database named trainingdb 

Database- trainingdb

2.Create a collection employees with documents that include:

use trainingdb
switched to db trainingdb
db["employees"].find()

3.Insert 4 employees with varying skill sets and joining dates

db.employees.insertMany([
  {
    name: "Haley",
    age: 29,
    isManager: true,
    skills: ["JavaScript", "MongoDB", "React"],
    joiningDate: new Date("2023-01-10"),
    profile: {
      linkedin: "https://linkedin.com/in/haley",
      portfolio: "https://haley.dev"
    }
  },
  {
    name: "Riya",
    age: 24,
    isManager: false,
    skills: ["Python", "HTML"],
    joiningDate: new Date("2022-11-20"),
    profile: {
      linkedin: "https://linkedin.com/in/riya",
      portfolio: "https://riya.dev"
    }
  },
  {
    name: "Nilaa",
    age: 27,
    isManager: false,
    skills: ["C++", "Python", "ML", "Data Science"],
    joiningDate: new Date("2023-07-01"),
    profile: {
      linkedin: "https://linkedin.com/in/nilaa",
      portfolio: "https://nilaa.dev"
    }
  },
  {
    name: "Zayan",
    age: 31,
    isManager: true,
    skills: ["Java", "Spring", "SQL"],
    joiningDate: new Date("2021-05-15"),
    profile: {
      linkedin: "https://linkedin.com/in/zayan",
      portfolio: "https://zayan.dev"
    }
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682f1bb0e14fb0a0007abf15'),
    '1': ObjectId('682f1bb0e14fb0a0007abf16'),
    '2': ObjectId('682f1bb0e14fb0a0007abf17'),
    '3': ObjectId('682f1bb0e14fb0a0007abf18')
  }
}
4.Query all employees who:
            Have more than 2 skills
            Joined after a specific date

db.employees.find({

  $expr: { $gt: [ { $size: "$skills" }, 2 ] },
  joiningDate: { $gt: new Date("2023-06-01") }
})
--Result
{
  _id: ObjectId('682f1bb0e14fb0a0007abf17'),
  name: 'Nilaa',
  age: 27,
  isManager: false,
  skills: [
    'C++',
    'Python',
    'ML',
    'Data Science'
  ],
  joiningDate: 2023-07-01T00:00:00.000Z,
  profile: {
    linkedin: 'https://linkedin.com/in/nilaa',
    portfolio: 'https://nilaa.dev'
  }
}

5.Add a new field rating (float) to one employee

db.employees.updateOne(
  { name: "Riya" },
  { $set: { rating: 4.5 } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

6.Find all employees with rating field of type double

db.employees.find({
  rating: { $type: "double" }
})
--Result
{
  _id: ObjectId('682f1bb0e14fb0a0007abf16'),
  name: 'Riya',
  age: 24,
  isManager: false,
  skills: [
    'Python',
    'HTML'
  ],
  joiningDate: 2022-11-20T00:00:00.000Z,
  profile: {
    linkedin: 'https://linkedin.com/in/riya',
    portfolio: 'https://riya.dev'
  },
  rating: 4.5
}

7.Exclude the _id field in a query result and show only name and skills

db.employees.find(
  {},
  { _id: 0, name: 1, skills: 1 }
)
--Result
{
  name: 'Haley',
  skills: [
    'JavaScript',
    'MongoDB',
    'React'
  ]
}
{
  name: 'Riya',
  skills: [
    'Python',
    'HTML'
  ]
}
{
  name: 'Nilaa',
  skills: [
    'C++',
    'Python',
    'ML',
    'Data Science'
  ]
}
{
  name: 'Zayan',
  skills: [
    'Java',
    'Spring',
    'SQL'
  ]
}
trainingdb
