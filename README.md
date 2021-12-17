# mvskeleton

A sample Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

It enables an easy control of the MVC architecture: 


\\section{Scale}

\\subsection{How To}

\\subsubsection{Add (listened) value}

To acquire more data to be used more than once or in more than one view,
it may be stored in the model

\\subsubsection{Add db side}

To store data, there needs to be a corresponding table in sqflite. If
the data received is json-encoded, by creating a table with the same
keys name minus the \"-\" character, the serialized data can be, if it
is necessary, directly stored in the db from the network, without
further processing or converting, which is very fast.

\\subsubsection{Acquire non-persistent one-time-use data}

To acquire data needed for a single operation, with no need for
persistence, they can be passed as the return argument of a method
invocation from View-\>Controller-\>NetController

\\subsubsection{Acquire non-persistent data}

To acquire data needed for more than one operation, with no need for
persistence, instead of passing parameters between
View-\>Controller-\>NetController, the latter could reference the
controller again and update the model only the first time, exploiting
the provider. There is no need for parameter passing since all the view
will be notified by Provider

\\subsubsection{Acquire persistent one-time-use data}

If you want to acquire data that you use for an operation only, but are
valid for a long period of time (i.e. token), you can easily make the
View-\>Controller-\>DbModel-\>NetController method call totally
transparent for the controller. The DbModel invokes the NetController
only if there is an explicit need to look for new data. As above, and as
discussed before, the data can be stored in the model and even observed,
but clearly it would not be worth in this case.

\\subsubsection{Acquire persistent data}

As above, but if the data is large or asked for frequently, it MUST be
observed by the view, otherwise the GUI calls may be blocking.

\\subsubsection{Create a view}

Now a new view can be created, then it needs to be associated with a
Phase. Once associated with a phase,the State-machine table in main.dart
can be updated, associating the new view with the new phase. Now a
predecessor phase can be selected, and a corresponding controller method
created, which will be called by its predecessor View class to make the
transition to the predecessor Phase(current phase of the application) to
thew new phase.

\\subsubsection{Example for not persistent data}

\\begin{itemize}

\\item I add GetExerciseData method to the NetController, which returns
the data, add a method to the controller to use it and get its return
argument. NetController makes an async call to remote

\\item I create the view ClientMenuApi and create the corresponding
method to acquire and use the method from Controller. I the new view
with the phase ClientMenu, and choose its predecessor view, that will be
GetTokenFromPolar

\\item I choose which action within the view GetTokenFromPolar causes
the Controller to modify the Model Phase to ClientMenu (which is
observed by the state machine) causing the state machine to transition
to the associated phase\'s view.

\\item Now, when within the view GetTokenFromPolar, a certain user
action causes the transition to happen and the data to be shown

\\end{itemize}

\\subsubsection{Example for persistent data}

\\begin{itemize}

\\item If the data is used constantly, I create an attribute in the
model, even an observed object

\\item I create a consistent table in the sqflite db

\\item I add GetExerciseData method to the NetController, which returns
the data, add a method to the DbModel to use it, and a method to the
Controller to use it. If it\'s a commonly asked for data, I add it as a
listened object, if not, I pass it as a return argument. NetController
makes an async call to remote when the DbModel needs it, in a
transparent way. It could be made asynchronous is the object to be
updated is observed in the model

\\item I create the view ClientMenuApi and create the corresponding
method to acquire and use the data, contacting the Controller. I
associate it with the phase ClientMenu, and choose its predecessor, that
will be the view GetTokenFromPolar, in which there will be a button or a
trigger that will cause the model Phase to be updated

\\item I choose which action within the view GetTokenFromPolar causes
the Controller to modify the Model Phase to ClientMenu (which is
observed by the state machine) causing the state machine to transition
to the associated phase\'s view.

\\item Now, when within the view GetTokenFromPolar, a certain user
action causes the transition to happen and the data to be shown.

\\end{itemize}
