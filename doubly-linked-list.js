function Link(val) {
  this.val = val;
  this.nxt = null;
  this.prev = null;
}

function LinkedList() {
  this.head = new Link();
  this.tail = new Link();
  this.head.nxt = this.tail;
  this.tail.prev = this.head;
}

LinkedList.prototype.push = function(val) {
  var link = new Link(val);
  var lastLink = this.tail.prev;

  link.prev = lastLink;
  link.nxt = this.tail;
  lastLink.nxt = link;
  this.tail.prev = link;

  return link.val;
};

LinkedList.prototype.pop = function() {
  if (this.tail.prev === this.head) {
    return;
  } else {
    var lastLink = this.tail.prev;
    lastLink.prev.nxt = this.tail;
    this.tail.prev = lastLink.prev;

    return lastLink.val;
  }
};

LinkedList.prototype.shift = function() {
  if (this.head.nxt === this.tail) {
    return;
  } else {
    var firstLink = this.head.nxt;
    this.head.nxt = firstLink.nxt;
    firstLink.nxt.prev = this.head;

    return firstLink.val;
  }

};

LinkedList.prototype.unshift = function(val) {
  var link = new Link(val);
  link.nxt = this.head.nxt;
  this.head.nxt.prev = link;
  this.head.nxt = link;
  link.prev = this.head;

  return link.val;
};

LinkedList.prototype.insert = function(idx, val) {
  current = this.head;
  current_idx = -1;
  while (current_idx !== idx) {
    current_idx += 1;
    current = current.nxt;
    if (current === this.tail) {
      return;
    }
  }
  var link = new Link(val);
  link.prev = current.prev;
  link.prev.nxt = link;
  current.prev = link;
  link.nxt = current;

  return val;
};

LinkedList.prototype.delete_at = function(idx) {
  current = this.head;
  current_idx = -1;
  while (current_idx !== idx) {
    current_idx += 1;
    current = current.nxt;
    if (current === this.tail) {
      return;
    }
  }
  var next = current.nxt;
  var prev = current.prev;

  next.prev = prev;
  prev.nxt = next;

  return current.val;
};
