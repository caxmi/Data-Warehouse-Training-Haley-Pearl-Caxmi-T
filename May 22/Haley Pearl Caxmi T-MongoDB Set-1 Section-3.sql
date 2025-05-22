MongoDB Schema & Relationships Exercise Set
Section 3: One-to-Many (Embedded)

1.In the same schooldb , create a teachers collection

Collection-teachers

2.Insert documents where each teacher has an embedded array of classes they teach (e.g., ["Math", "Physics"] )

use schooldb
switched to db schooldb
db["teachers"].find() 
db.teachers.insertMany([
  {
    name: "Mr. Sharma",
    subject: "Science",
    classes: ["Physics", "Chemistry"]
  },
  {
    name: "Ms. Anika",
    subject: "Technology",
    classes: ["Computer Science", "AI", "Math"]
  },
  {
    name: "Mr. Zayan",
    subject: "Robotics",
    classes: ["Electronics", "Math", "Mechanics"]
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682f214e43bc2a35c4613c62'),
    '1': ObjectId('682f214e43bc2a35c4613c63'),
    '2': ObjectId('682f214e43bc2a35c4613c64')
  }
}

3.Query teachers who teach "Physics"

db.teachers.find({ classes: "Physics" })
--Result
{
  _id: ObjectId('682f214e43bc2a35c4613c62'),
  name: 'Mr. Sharma',
  subject: 'Science',
  classes: [
    'Physics',
    'Chemistry'
  ]
}

4.Add a new class "Robotics" to a specific teacher's classes array

db.teachers.updateOne(
  { name: "Ms. Anika" },
  { $addToSet: { classes: "Robotics" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

5.Remove "Math" from one teacher’s class list

db.teachers.updateOne(
  { name: "Mr. Zayan" },
  { $pull: { classes: "Math" } }
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