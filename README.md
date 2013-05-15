A personal news portal developed for course CPSC531
==================
A website which organize your feeds and categorize feed entries under pre-defined categories automatically, so user can filter what they interested in efficiently

This is the User interface, which is backed by the [date mining program]((https://github.com/shaofenchen/datamining_cpsc531)) doing text categorization for course cpsc531 - Advance database

**Dependency**
* Environment: 

  OS: Ubuntu 12.04
  
  java jre ~>1.6
  
  Ruby ~> 1.9.2
  
  Rails ~> 3.2

***Instruction***


* Install [Wordnet2.1 ~ 3.0](http://wordnet.princeton.edu/wordnet/download/current-version/), depends on your platform. and place the /dict folder in /lib/java/. I've already extract the  Linux version /dict under /lib/java folder, which have not yet test in windows 

* Clone the code,

```ruby

	bundle install
	rake db:migrate
	rake db:seed
```
