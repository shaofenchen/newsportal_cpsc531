Text categorization
==================

A data mining program doing text categorization for course cpsc531 - Advance database

**Under construction**

***Instruction***

* Install [Wordnet2.1 ~ 3.0](http://wordnet.princeton.edu/wordnet/download/current-version/), depends on your platform.

* Changed the corresponding path of Wordnet dictionary in TextClassification.java

* Updated libraries(the new jar can be found at /newlib for convenience): 

  commons-io-1.2.jar => commons-io-2.4.jar
    
  jwi-2.1.3 => edu.mit.jwi_2.2.4.jar
* Currently the training data set are in src/test/resources/data/articles folders, the structure of this folders should look like this(a 2-tier structure):	
```ruby
	- articles(or whatever you named it)
		- (folder)category1
			-  text_file1
			-  text_file2
			-  text_file3
				...
		- (folder)category2
				...
		- (folder)category3
				...
```
* Run the main class TextClassification.java