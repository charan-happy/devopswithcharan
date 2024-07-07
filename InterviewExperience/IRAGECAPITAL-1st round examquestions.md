Online Hacker rank test Timeduration: 2 hours Total 7 questions and 2 are multiple choice questions and remaining are coding questions.

EXP : 2-4 years 

<details><summary>1. Solve the below 👇

Employee_Data.csv

|S.NO.|First_Name|Second_Name|Age|Gender|Experience|
|---|---|---|---|---|---|
|1|Anita |Smith|36|Female | 2 |
|2|Bob|Jones|45|Male|4|
|3|Lisa|Johnson|45|Female|4|
|4|Mike|White|25|Male|4|
|5|Tara|Green|48|Female|8|
|6|Alice|Williams|51|Female|4|
|7|Mary|Brown|64|64|Female|5|
|8|Lisa|Wilson|59|Male|8|
|9|Bob|Miller|37|Male|5|
|10|Sarah|Green|28|Female|3|
|11|Emily|White|24|Female|4|
|12|Wilson|Jones|38|Male|8|

what is the output of the following python code
```python
import pandas as pd
data = pd.read_csv('Employee_Data.csv')
new_data = data.groupby('First_Name').size().reset_index(name='count')
print(new_data)
```
</summary> solution: </details>

<details><summary>2. John is working on kubernetes. He has used the Kubernetes API to create the object via kubectl with API request and also included the required information in json format in the request But, still he is getting an error. Then which of the following options can be solution for the above mentioned error  

> 1. provide the information to kubectl in yaml file
> 2. provide the information to kubectl in JSON file
> 3. Create a Deployment using a kube file
> 4. Create a Deployment using a Dockerfile
</summary>Ans: 1 </details>

<details><summary>3. you were configuring a pipeline with jobs in the `.gitlab-ci.yaml` file. However, it failed. Here is the some of the places that can be checked

> 1. In pipeline collections having grouped jobs
> 2. In the pipeline graph, on the pipeline detail view
> 3. In the job view,in the global and detailed views of a job
> 4. In the pipeline widgets, in the merge requests and commit pages

which of the places would be most suitable for finding reasons for the failure in the pipeline ?</summary> ANS: 2,3,4</details>

<details><summary> 5. **IRAGE Stock Exchange**

IRage operates a stock exchange named ISE where multiple clients buy/sell stocks. Since, the traffic has increased Ten folds in the recent past and for better failover performance iRage has started its Disaster Recovery infrastructure. Since, it is still in its initial days it might have bugs and you have been assigned the task to check the sanity of this infrastructure.

whenever a trade happens in ISE. Both LIVE Infrastructure and DR Infrastructure log them. `order_id` is an unique identifier used for an order. Trade happens between two users i.e; two `order_ids`. you'll be provided a list of trade logged by both LIVE Infrastructure and DR infrastructure for a day and you'll need to find out whether the systems are working correctly and logging the simmilar things.

Input format:

<infrastructure>,<order_id1>,<order_id2>,<timestamp_at_which_trade_took_place>

each on new line

ex: 

DR,100,101,09:15:00

LIVE, 102,103,,09:15:00

The above example mean that DR infrastructure logged a trade between `order_ids` 100 and 101 at 9:15am while `LIVE` infrastructure logged a trade between `order_ids` 102 and 103 at 09:15am

Output Format

sorted Timestamps each on a new line where discrepancy between LIVE and DR infrastructure exists OR print "matched" in case both log simmilar things

sample input1 :

DR,100,101,09:15:00  
LIVE,107,103,09:17:00  
DR,105,106,09:16:30  
LIVE,101,100,09:15:00  
LIVE,105,106,09:16:30  
DR,107,103,09:17:00  

sample output1:

matched


In the above example both LIVE and DR indicate same three trades happened and hence
output matched
1. Order_ids 100 and 101 at 09:15:00
2. Order_ids 105 and 106 at 09:16:30

3. Order_ids 107 and 103 at 09:17:00

Sample input2:
LIVE,100,101,09:15:00
LIVE,100,102,09:15:00
DR,103,104,09:18:23
DR,101,100,09:15:00
DR,100,102,09:15:00
LIVE,105,106,09:16:47

Sample output2:

The DR logged a trade for timestamp 09:18:23 while LIVE did not similarly LIVE logged a
trade for 09:16:47 while DR did not and hence log the timestamps in sorted order each on

a new line

Things to NOTE:

1. order_ids can shuffle ie trade happening between order_ids 100 and 101 or 101 and 100
are the same since the same users are involved in the trade.
6
7
2. Trades can be logged in any order and not necessarily sorted based on timestamps
3. A discrepancy is defined when LIVE infrastructure logs something not logged by DR
infrastructure and vice versa
4. In case multiple discrepancies occur on the same timestamp log that timestamp in
output only once
Sample input
DR,100,101,09:15:00
Sample output
In the above example both LIVE and DR Indicate
LIVE,107,103,09:17:00
1. Order ids 100 and 101 at 09:15:00
DR, 105, 106,09:16:30
2. Order lds 105 and 106 at 09:16:30
LIVE,101,100,09:15:00
3. Order ids 107 and 103 at 09:17:00
LIVE, 105, 106,09:16:30

<details><summary>6. 


```python
import pandas as pd
df = pd.DataFrame([[2,5],
[56,20]],
index = list('pq'),
columns = list('ab'))
def loc(a,b):
  try:
    out = df.loc[a,b]
  except:
    return 0
  return out
def iloc(a,b):
  try:
    out = df.iloc[a,b]
  except:
    return 0
  return out
print(iloc(0,'b'))
print(loc(0, 'b'))
print(loc('q', 'a'))
print(iloc('q','b'))
```
Options: A. 5,5,56,20 B. 0,0,56,0 C 5,0,56.20 D. 0,0,56,20

</summary>Ans: A</details>

<details><summary>
Question 7

Square investment

Bob and John both have N dollars each and want to invest some money in Jack. They
will invest amounts i (1 ≤ i ≤ N). Jack has promised them a return of i * j. Bob and
John will be happy if the return is a perfect square.
Task
Calculate the number of pairs of investment (i, j) such that the return is a perfect square.
Example 1
Assumptions
Input
N = 4
Output: 6
Approach
(1, 1), (1, 4), (2, 2), (3, 3), (4, 1), and (4, 4) are the possible pairs.
Function description
Complete the function solution! The function takes the following parameter and returns
the solution.
* N Represents the total amount
</details> </summary>

<details><summary>7. [Docker] Setting up a Dockerized python application

Your task is to set up a Python application on Docker with the following functionalities.

### Tasks

1. Ensure that the Docker daemon is running on the machine  
2. Create a Python application named "hello.py" that prints "Hello, World!" to the console  
3. Create a Dockerfile inside the pythonapp directory with the following configuration:
    * Use the python:3.9-alpine image as the base image.
    * Set the working directory to /usr/src/app.
    * Copy the hello.py file into the container.
    * Set the command to run the Python script using python hello.py.
4. Build a Docker image from the Dockerfile and name it my-python-app.
5. Run the Docker image my-python-app with the container name pythonapp.
6. Submit the solution.

### Submission instructions

When you click the Submit button, the submission will be evaluated against the test cases.

Platform
ubuntu 20.04
Token
ssh ubuntu@54.254.252.173
Password: 2108451386ea15965879604263e0c51 </summary> </details>



