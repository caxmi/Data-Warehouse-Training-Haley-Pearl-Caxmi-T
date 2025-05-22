MongoDB Exercise Set-2 : Project & Task Tracker
Section 1: Basic Document Modeling & Insertion

1.Create a database called taskmanager

use taskmanager
switched to db taskmanager

2.Insert 3 users into a users collection. 

db.users.insertMany([
  {
    _id: ObjectId("66522aa1f1a2a010aa111111"),
    name: "Haley",
    email: "haley@example.com",
    role: "admin",
    active: true
  },
  {
    _id: ObjectId("66522aa1f1a2a010aa222222"),
    name: "Riya",
    email: "riya@example.com",
    role: "developer",
    active: true
  },
  {
    _id: ObjectId("66522aa1f1a2a010aa333333"),
    name: "Nilaa",
    email: "nilaa@example.com",
    role: "manager",
    active: false
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66522aa1f1a2a010aa111111'),
    '1': ObjectId('66522aa1f1a2a010aa222222'),
    '2': ObjectId('66522aa1f1a2a010aa333333')
  }
}

3.Insert 2 projects into a projects collection:

db.projects.insertMany([
  {
    _id: ObjectId("66522aa1f1a2a010bb111111"),
    title: "AI Dashboard",
    description: "Dashboard for real-time AI insights",
    startDate: new Date(),  // TODAY, within 30 days
    status: "active",
    progress: 40,
    createdBy: {
      _id: ObjectId("66522aa1f1a2a010aa111111"),
      name: "Haley"
    }
  },
  {
    _id: ObjectId("66522aa1f1a2a010bb222222"),
    title: "Mobile App Revamp",
    description: "Complete UI redesign of the app",
    startDate: new Date(),  // TODAY
    status: "completed",
    progress: 100,
    createdBy: {
      _id: ObjectId("66522aa1f1a2a010aa222222"),
      name: "Riya"
    }
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66522aa1f1a2a010bb111111'),
    '1': ObjectId('66522aa1f1a2a010bb222222')
  }
}

4.Insert 5 tasks into a tasks collection:

db.tasks.insertMany([
  {
    title: "Fix Login Bug",
    assignedTo: ObjectId("66522aa1f1a2a010aa222222"), // Riya
    projectId: ObjectId("66522aa1f1a2a010bb111111"),
    priority: "high",
    dueDate: new Date("2025-05-25"),
    status: "in-progress"
  },
  {
    title: "Create Dashboard Layout",
    assignedTo: ObjectId("66522aa1f1a2a010aa222222"),
    projectId: ObjectId("66522aa1f1a2a010bb111111"),
    priority: "medium",
    dueDate: new Date("2025-06-01"),
    status: "not started"
  },
  {
    title: "Test API Integration",
    assignedTo: ObjectId("66522aa1f1a2a010aa333333"),
    projectId: ObjectId("66522aa1f1a2a010bb111111"),
    priority: "low",
    dueDate: new Date("2025-06-15"),
    status: "completed"
  },
  {
    title: "Design UI Components",
    assignedTo: ObjectId("66522aa1f1a2a010aa222222"),
    projectId: ObjectId("66522aa1f1a2a010bb222222"),
    priority: "high",
    dueDate: new Date("2025-06-05"),
    status: "in-progress",
    tags: ["urgent", "frontend"]
  },
  {
    title: "Code Cleanup",
    assignedTo: ObjectId("66522aa1f1a2a010aa222222"),
    projectId: ObjectId("66522aa1f1a2a010bb222222"),
    priority: "high",
    dueDate: new Date("2025-05-28"),
    status: "not started"
  }
])
--Result
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('682f2b807ef019f2c4c0c6fc'),
    '1': ObjectId('682f2b807ef019f2c4c0c6fd'),
    '2': ObjectId('682f2b807ef019f2c4c0c6fe'),
    '3': ObjectId('682f2b807ef019f2c4c0c6ff'),
    '4': ObjectId('682f2b807ef019f2c4c0c700')
  }
}

Section 2: Filtering & Querying

5.Find all tasks with priority "high" that are not completed

db.tasks.find({ priority: "high", status: { $ne: "completed" } }).pretty()
--Result
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fc'),
  title: 'Fix Login Bug',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'high',
  dueDate: 2025-05-25T00:00:00.000Z,
  status: 'in-progress'
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c6ff'),
  title: 'Design UI Components',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb222222'),
  priority: 'high',
  dueDate: 2025-06-05T00:00:00.000Z,
  status: 'in-progress',
  tags: [
    'urgent',
    'frontend'
  ]
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c700'),
  title: 'Code Cleanup',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb222222'),
  priority: 'high',
  dueDate: 2025-05-28T00:00:00.000Z,
  status: 'not started'
}

6.Query all active users with role "developer"

db.users.find({ role: "developer", active: true }).pretty()
--Result
{
  _id: ObjectId('66522aa1f1a2a010aa222222'),
  name: 'Riya',
  email: 'riya@example.com',
  role: 'developer',
  active: true
}

7.Find all tasks assigned to a specific user (by ObjectId )

db.tasks.find({ assignedTo: ObjectId("66522aa1f1a2a010aa222222") }).pretty()
--Result
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fc'),
  title: 'Fix Login Bug',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'high',
  dueDate: 2025-05-25T00:00:00.000Z,
  status: 'in-progress'
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fd'),
  title: 'Create Dashboard Layout',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'medium',
  dueDate: 2025-06-01T00:00:00.000Z,
  status: 'not started'
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c6ff'),
  title: 'Design UI Components',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb222222'),
  priority: 'high',
  dueDate: 2025-06-05T00:00:00.000Z,
  status: 'in-progress',
  tags: [
    'urgent',
    'frontend'
  ]
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c700'),
  title: 'Code Cleanup',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb222222'),
  priority: 'high',
  dueDate: 2025-05-28T00:00:00.000Z,
  status: 'not started'
}

8.Find all projects started in the last 30 days

const thirtyDaysAgo = new Date();
thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
db.projects.find({ startDate: { $gte: thirtyDaysAgo } }).pretty()
--Result
{
  _id: ObjectId('66522aa1f1a2a010bb111111'),
  title: 'AI Dashboard',
  description: 'Dashboard for real-time AI insights',
  startDate: 2025-05-22T13:49:44.876Z,
  status: 'active',
  progress: 40,
  createdBy: {
    _id: ObjectId('66522aa1f1a2a010aa111111'),
    name: 'Haley'
  }
}
{
  _id: ObjectId('66522aa1f1a2a010bb222222'),
  title: 'Mobile App Revamp',
  description: 'Complete UI redesign of the app',
  startDate: 2025-05-22T13:49:44.876Z,
  status: 'completed',
  progress: 100,
  createdBy: {
    _id: ObjectId('66522aa1f1a2a010aa222222'),
    name: 'Riya'
  }
}

Section 3: Update Operations

9.Change the status of one task to "completed"

db.tasks.updateOne(
  { title: "Code Cleanup" },
  { $set: { status: "completed" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

10.Add a new role field called "teamLead" to one of the users 

db.users.updateOne(
  { name: "Nilaa" },
  { $set: { role: "teamLead" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

11.Add a new tag array to a task: ["urgent", "frontend"]

db.tasks.updateOne(
  { title: "Create Dashboard Layout" },
  { $set: { tags: ["urgent", "frontend"] } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

Section 4: Array and Subdocument Operations

12.Add a new tag "UI" to the task’s tags array using $addToSet

db.tasks.updateOne(
  { title: "Design UI Components" },
  { $addToSet: { tags: "UI" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

13.Remove "frontend" from a task’s tag list

db.tasks.updateOne(
  { title: "Design UI Components" },
  { $pull: { tags: "frontend" } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

14.Use $inc to increment a project ’s progress field by 10

db.projects.updateOne(
  { title: "AI Dashboard" },
  { $inc: { progress: 10 } }
)
--Result
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

Section 5: Aggregation & Lookup

15.Use $lookup to join tasks with users and show task title + assignee name

db.tasks.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "assignedTo",
      foreignField: "_id",
      as: "assignee"
    }
  },
  { $unwind: "$assignee" },
  {
    $project: {
      _id: 0,
      title: 1,
      assigneeName: "$assignee.name"
    }
  }
])
--Result
{
  title: 'Fix Login Bug',
  assigneeName: 'Riya'
}
{
  title: 'Create Dashboard Layout',
  assigneeName: 'Riya'
}
{
  title: 'Test API Integration',
  assigneeName: 'Nilaa'
}
{
  title: 'Design UI Components',
  assigneeName: 'Riya'
}
{
  title: 'Code Cleanup',
  assigneeName: 'Riya'
}

16.Use $lookup to join tasks with projects , and filter tasks where project status = active

db.tasks.aggregate([
  {
    $lookup: {
      from: "projects",
      localField: "projectId",
      foreignField: "_id",
      as: "project"
    }
  },
  { $unwind: "$project" },
  { $match: { "project.status": "active" } }
])
--Result
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fc'),
  title: 'Fix Login Bug',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'high',
  dueDate: 2025-05-25T00:00:00.000Z,
  status: 'in-progress',
  project: {
    _id: ObjectId('66522aa1f1a2a010bb111111'),
    title: 'AI Dashboard',
    description: 'Dashboard for real-time AI insights',
    startDate: 2025-05-22T13:49:44.876Z,
    status: 'active',
    progress: 50,
    createdBy: {
      _id: ObjectId('66522aa1f1a2a010aa111111'),
      name: 'Haley'
    }
  }
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fd'),
  title: 'Create Dashboard Layout',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'medium',
  dueDate: 2025-06-01T00:00:00.000Z,
  status: 'not started',
  tags: [
    'urgent',
    'frontend'
  ],
  project: {
    _id: ObjectId('66522aa1f1a2a010bb111111'),
    title: 'AI Dashboard',
    description: 'Dashboard for real-time AI insights',
    startDate: 2025-05-22T13:49:44.876Z,
    status: 'active',
    progress: 50,
    createdBy: {
      _id: ObjectId('66522aa1f1a2a010aa111111'),
      name: 'Haley'
    }
  }
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fe'),
  title: 'Test API Integration',
  assignedTo: ObjectId('66522aa1f1a2a010aa333333'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'low',
  dueDate: 2025-06-15T00:00:00.000Z,
  status: 'completed',
  project: {
    _id: ObjectId('66522aa1f1a2a010bb111111'),
    title: 'AI Dashboard',
    description: 'Dashboard for real-time AI insights',
    startDate: 2025-05-22T13:49:44.876Z,
    status: 'active',
    progress: 50,
    createdBy: {
      _id: ObjectId('66522aa1f1a2a010aa111111'),
      name: 'Haley'
    }
  }
}

17.Use $group to get count of tasks per status

db.tasks.aggregate([
  {
    $group: {
      _id: "$status",
      taskCount: { $sum: 1 }
    }
  }
])
--Result
{
  _id: 'not started',
  taskCount: 1
}
{
  _id: 'completed',
  taskCount: 2
}
{
  _id: 'in-progress',
  taskCount: 2
}

18.Use $match , $sort , and $limit to get top 3 soonest due tasks

db.tasks.aggregate([
  { $match: {} },
  { $sort: { dueDate: 1 } },
  { $limit: 3 }
])
--Result
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fc'),
  title: 'Fix Login Bug',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'high',
  dueDate: 2025-05-25T00:00:00.000Z,
  status: 'in-progress'
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c700'),
  title: 'Code Cleanup',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb222222'),
  priority: 'high',
  dueDate: 2025-05-28T00:00:00.000Z,
  status: 'completed'
}
{
  _id: ObjectId('682f2b807ef019f2c4c0c6fd'),
  title: 'Create Dashboard Layout',
  assignedTo: ObjectId('66522aa1f1a2a010aa222222'),
  projectId: ObjectId('66522aa1f1a2a010bb111111'),
  priority: 'medium',
  dueDate: 2025-06-01T00:00:00.000Z,
  status: 'not started',
  tags: [
    'urgent',
    'frontend'
  ]
}
taskmanager

