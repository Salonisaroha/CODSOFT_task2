import 'package:flutter/material.dart';
import 'dart:async';

class QuestionScreen extends StatefulWidget {
  final String category;
  const QuestionScreen({required this.category, Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final Map<String, List<Map<String, dynamic>>> _categoryQuestions = {
    'DSA': [
      {
        'question': 'Which of the following sorting algorithms can be used to sort a random linked list with minimum time complexity?',
        'options': [
          'Insertion Sort',
          'Quick Sort',
          'Heap Sort',
          'Merge Sort'
        ],
        'answer': 'Merge Sort'
      },
      {
        'question': 'Which data structure is LIFO?',
        'options': ['Queue', 'Stack', 'Array', 'Linked List'],
        'answer': 'Stack'
      },
      {
        'question': 'The size of the array should always be',
        'options': ['Positive','Negative','Whole Number','Real Number'],
        'answer': 'Positive'
      },
      {
        'question': 'Which of these methods of class String is used to obtain the length of the String object?',
        'options': ['get()','Sizeof()','lengthof()','length()'],
        'answer': 'length()'
      },
      {
        'question': 'In a circular linked list, the last node points to the',
        'options': ['this pointer','tail pointer','first node','middle node'],
        'answer': 'first node'
      },
      {
        'question': 'The process of inserting an element in the stack is called ',
        'options': ['create','Evaluation','push','pop'],
        'answer': 'push'
      },
      {
        'question': 'Two Basic Operations used in queue are:',
        'options': ['push and pop','Enqueue & Dequeue','insert and remove','none of these'],
        'answer': 'Enqueue & Dequeue'
      },
      {
        'question': 'A Kind of tree where every node in a tree can have at most two children.',
        'options': ['Binary tree','Binary Search tree','binary expression tree','none'],
        'answer': 'Binary tree'
      },
      {
        'question': 'A tree data structure is a------ data structure.',
        'options': ['Hierarchical','pre-defined','primary','none'],
        'answer': 'Hierarchical'
      },
      {
        'question': 'Graphs are represented using .',
        'options': ['Adjacency list','Adjacency tree','Adjacency queue','none'],
        'answer': 'Adjacency list'
      }
    ],
    'C++': [
      {
        'question': 'Which of the following is the correct identifier?',
        'options': [
          '&var_name',
          'VAR_123',
          'varname@',
          'None of the above'
        ],
        'answer': 'VAR_123'
      },
      {
        'question': 'Who invented C++?',
        'options': [
          'Guido van Rossum',
          'Dennis Ritchie',
          'Bjarne Stroustrup',
          'James Gosling'
        ],
        'answer': 'Bjarne Stroustrup'
      },{
        'question': 'Identify the incorrect constructor type.',
        'options': [
          'Friend constructor',
          'Default constructor',
          'parametrized constructor',
          'copy constructor'
        ],
        'answer': 'Friend constructor'
      },{
        'question': 'By which of the following can the if-else statement be replaced?',
        'options': [
          'Bitwise operator',
          'logical operator',
          'conditional operator',
          'arithmetic operator'
        ],
        'answer': 'conditional operator'
      },
      {
         'question': 'When can an inline function be expanded?',
        'options': [
          'Runtime',
          'Compile time',
          'Never gets expanded',
          'All of the above'
        ],
        'answer': 'Compile time'
      },
      {
        'question': 'The constants in C++ are also known as?',
        'options': [
          'Pre-processor',
          'literals',
          'const',
          'none'
        ],
        'answer': 'literals'
      },
      {
        'question': 'Choose the correct subscript operator',
        'options': [
          '[]',
          '{}',
          '*',
          '()'
        ],
        'answer': '[]'
      },
      {
        'question': 'Data members and member functions of a class are private by default. True or false',
        'options': [
          'True',
          'False',
          'Depends on code',
          'None'
        ],
        'answer': 'True'
      },
      {
        'question': 'Which of the following gives the 4th element of the array?',
        'options': [
          'Array[0]',
          'Array[1]',
          'Array[3]',
          'None'
        ],
        'answer': 'Array[3]'
      },
      {
        'question': 'Which type of memory is used by an Array in C++ programming language?',
        'options': [
          'Contiguous',
          'Non-Contiguous',
          'Both A and B',
          'None'
        ],
        'answer': 'Contiguous'
      }
    ],
    'Computer Networks': [
      {
        'question': 'What is a LAN?',
        'options': [
          'Local Area Network',
          'Large Area Network',
          'Long Area Network',
          'None of the above'
        ],
        'answer': 'Local Area Network'
      },
      {
        'question': 'What does IP stand for?',
        'options': [
          'Internet Provider',
          'Internet Protocol',
          'International Protocol',
          'Internet Program'
        ],
        'answer': 'Internet Protocol'
      },
      {
        'question': 'Which of the following transmission directions listed is not a legitimate channel?',
        'options': ['Simplex', 'Half Duplex', 'Full Duplex', 'Double Duplex'],
        'answer': 'Double Duplex'
      },
      {
        'question': 'A collection of hyperlinked documents on the internet forms the ?.?',
        'options': ['WWW', 'E-mail system', 'Mailing list', 'Hyper text markup language'],
        'answer': 'WWW'
      },
      {
        
        'question': ' A proxy server is used as the computer?',
        'options': ['With external access', 'acting as a backup', 'performing file handling', 'accessing user permissions'],
        'answer': 'with external access'
      },
      {
        'question': ' Which software prevents the external access to a system?',
        'options': ['Firewall', 'Gateway', 'Router', 'virus checker'],
        'answer': 'Firewall'
      },
      {
        'question': ' Which one of the following is the most common internet protocol?',
        'options': ['HTML', 'NetBEUI', 'TCP/IP', 'IPX/SPX'],
        'answer': 'TCP/IP'
      },
      {
         'question': ' The term FTP stands for?',
        'options': ['File transfer program', 'File transmission protocol', 'File transfer protocol', 'File transfer protection'],
        'answer': 'File transfer protocol'
      },
      {
         'question': ' Which one of the following is not a network topology?',
        'options': ['Star', 'Ring', 'Bus', 'peer to peer'],
        'answer': 'peer to peer'
      },
      {
        'question': 'When the mail server sends mail to other mail servers it becomes ___ ?',
        'options': ['SMTP client', 'SMTP Server', 'peer', 'Master'],
        'answer': 'SMTP client'
      }
    ],
    'Operating System': [
      {
        'question': 'What is an operating system?',
        'options': [
          'Software that manages hardware',
          'A type of hardware',
          'A computer program',
          'None of the above'
        ],
        'answer': 'Software that manages hardware'
      },
      {
        'question': 'Which one is a mobile OS?',
        'options': ['Windows', 'Linux', 'Android', 'MacOS'],
        'answer': 'Android'
      },
      {
        'question': 'Which of the following is the extension of Notepad?',
        'options': ['.txt', '.xls', '.ppt', '.bmp'],
        'answer': '.txt'
      },
      {
'question': 'What else is a command interpreter called?',
        'options': ['prompt', 'kernal', 'shell', 'command'],
        'answer': 'shell'
      },
      {
        'question': 'BIOS is used?',
        'options': ['By operating system', 'By compiler', 'By interpreter', 'By application software'],
        'answer': 'By operating system'
      },
      {
'question': 'What is the mean of the Booting in the operating system?',
        'options': ['Restarting computer', 'Install the program', 'To scan', 'To turn off'],
        'answer': 'Restarting computer'
      },
      {
        'question': 'Banker\'s algorithm is used?',
        'options': ['To prevent deadlock', 'To deadlock recovery', 'To solve the deadlock', 'None of these'],
        'answer': 'To prevent deadlock'
      },
      {
        
        'question': ' What is the full name of the DSM?',
        'options': ['Direct system module', 'Direct system memory', 'Demoralized system memory', 'Distributed shared memory'],
        'answer': 'Distributed shared memory'
      },
      {
        'question': '  What is bootstrapping called?',
        'options': ['Cold boot', 'Cold hot boot', 'Cold hot strap', 'Hot boot'],
        'answer': 'Cold boot'
      },
      {
        'question': ' Which of the following is a single-user operating system?',
        'options': ['Windows', 'MAC', 'Ms-Dos', 'None of these'],
        'answer': 'Ms-Dos'
      }
    ],
  };

  late List<Map<String, dynamic>> _questions;
  int _currentQuestionIndex = 0;
  bool _isAnswered = false;
  Color _optionColor = Colors.white;
  late Timer _timer;
  int _timeRemaining = 30;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _questions = _categoryQuestions[widget.category] ?? [];
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        _timer.cancel();
        _showTimeUpDialog();
      }
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Time Up!'),
        content: Text('You have run out of time.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _goToNextQuestion();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _isAnswered = false;
        _optionColor = Colors.white;
        _timeRemaining = 30;
        _startTimer();
      });
    } else {
      _showScoreDialog();
    }
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Completed'),
        content: Text('You have completed the quiz.\nYour Score: $_score/${_questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  void _checkAnswer(String selectedOption) {
    setState(() {
      _isAnswered = true;
      _timer.cancel();
      if (_questions[_currentQuestionIndex]['answer'] == selectedOption) {
        _optionColor = Colors.green;
        _score++;
      } else {
        _optionColor = Colors.red;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.category),
        ),
        body: Center(
          child: Text('No questions available for this category.'),
        ),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Question ${_currentQuestionIndex + 1} of ${_questions.length}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                currentQuestion['question'],
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: (currentQuestion['options'] as List<String>).map((option) {
                return GestureDetector(
                  onTap: () => !_isAnswered ? _checkAnswer(option) : null,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: _isAnswered && currentQuestion['answer'] == option
                        ? _optionColor
                        : Colors.white,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                          option,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Time Remaining: $_timeRemaining seconds',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _isAnswered ? _goToNextQuestion : null,
                child: Text(
                  'Next Question',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
