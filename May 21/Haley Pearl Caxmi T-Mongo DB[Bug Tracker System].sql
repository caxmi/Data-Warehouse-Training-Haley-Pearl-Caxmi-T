Bug Tracker System

Database:bugtracker

Collection:bugs

1.Create a new database called bugtracker

use bugtracker
switched to db bugtracker
db["bugs"].find()

2.Insert 3 bug reports into a bugs collection

db.bugs.insertMany([
  {
    title: "Search function returns no results",
    reportedBy: "Haley",
    status: "Open",
    priority: "High",
    createdAt: new Date("2025-05-17T11:45:00Z")
  },
  {
    title: "Profile picture upload fails",
    reportedBy: "Vivi",
    status: "In Progress",
    priority: "Medium",
    createdAt: new Date("2025-05-16T16:20:00Z")
  },
  {
    title: "Notifications not clearing after read",
    reportedBy: "Pearl",
    status: "Open",
    priority: "Low",
    createdAt: new Date("2025-05-15T08:05:00Z")
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682db582914578edd9e568de'),
    '1': ObjectId('682db582914578edd9e568df'),
    '2': ObjectId('682db582914578edd9e568e0')
  }
}

3.Query all bugs with status: "open" and priority: "high"

db.bugs.find({
  status: "Open",
  priority: "High"
})
--Result
{
  _id: ObjectId('682db582914578edd9e568de'),
  title: 'Search function returns no results',
  reportedBy: 'Haley',
  status: 'Open',
  priority: 'High',
  createdAt: 2025-05-17T11:45:00.000Z
}

4.Update the status of a specific bug to "closed"

db.bugs.updateOne(
  { title: "Profile picture upload fails" },
  { $set: { status: "closed" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

5.Delete the bug that was reported by "Test User"

db.bugs.deleteOne({
  reportedBy: "Test User"
})
--Result
{
  acknowledged: true,
  deletedCount: 0        --Since there is no "Test User" in the reportedBy
}
bugtracker