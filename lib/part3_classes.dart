// Part 3 - Classes, named constructors, mixins and extensions.

/// A to-do task with a priority from 1 (low) to 3 (high).
class Task {
  final String title;
  final int priority;
  bool done;

  /// Creates a task. [priority] defaults to 1 and [done] to false.
  ///
  /// Throws an [ArgumentError] if [priority] is not between 1 and 3.
  Task(this.title, {this.priority = 1, this.done = false}) {
    if (priority < 1 || priority > 3) {
      throw ArgumentError('Priority must be between 1 and 3');
    }
  }

  /// An urgent task always has priority 3.
  Task.urgent(String title) : this(title, priority: 3);

  /// Switches [done] between true and false.
  void toggle() {
    done = !done;
  }

  /// Examples: "[ ] Buy milk (p1)" and "[x] Submit lab (p3)".
  @override
  String toString() {
    if (done) {
      return '[x] $title (p$priority)';
    } else {
      return '[ ] $title (p$priority)';
    }
  }
}

/// Gives any class a creation time.
mixin Timestamped {
  DateTime? _createdAt;

  DateTime? get createdAt => _createdAt;

  /// Sets the creation time to [time] (or now, if not given).
  ///
  /// Only the first call has an effect; later calls keep the first time.
  void stamp([DateTime? time]) {
    _createdAt ??= time ?? DateTime.now();
  }
}

/// A task that also knows when it was created.
class TimedTask extends Task with Timestamped {
  TimedTask(super.title, {super.priority});
}

/// Helpers for lists of tasks.
extension TaskListTools on List<Task> {
  /// The tasks that are not done yet, in the original order.
  List<Task> get pending {
    List<Task> list = [];
    for (var task in this) {
      if (!task.done) {
        list.add(task);
      }
    }
    return list;
  }

  /// How many tasks are done.
  int get doneCount {
    int count = 0;
    for (var task in this) {
      if (task.done) {
        count++;
      }
    }
    return count;
  }

  /// A new list sorted by priority, highest first.
  ///
  /// The original list must not change.
  List<Task> byPriority() {
    List<Task> copy = [...this];
    copy.sort((a, b) => b.priority.compareTo(a.priority));
    return copy;
  }
}
