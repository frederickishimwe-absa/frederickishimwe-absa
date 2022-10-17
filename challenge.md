
# Technical Challenge
## Introduction

As a Technical Challenge, the candidate should deliver an acceptance test suite to check the entire workflow of the open-source software Covenant (https://github.com/cobbr/Covenant).

```
Covenant is a web application that aims to highlight the attack surface of .NET.
It serves as a collaborative command and control platform for red teamers"
```

The candidate is expected to be able to setup the solution on his/her own. For further details, please refer to the instructions included in the next paragraph.

Delivery Deadline: *2 weeks from the moment when the challenge was sent*.

If you do not finish the challenge in time, please send your partial solution to us: we will evaluate the progress made under the given time constraint.

## Glossary and Installation

Before starting the challenge, it is strongly suggested, in order to get confident with Covenant's terminology and architecture, to consult its official documentation, available at:

https://github.com/cobbr/Covenant/wiki

Installation instructions:

https://github.com/cobbr/Covenant/wiki/Installation-And-Startup

## Challenge details

The candidate is expected to create a test pipeline able to simulate the behaviour of a user which interacts with the Covenant webapp. In general the pipeline should be able to test the following steps:

1. Log in as a new user.

2. Create a listener in the webapp ready to manage new incoming connection. 

   Reference: https://github.com/cobbr/Covenant/wiki/Bridge-Listeners.

3. Generate a launcher (there are no restrictions about the type of launcher). 

   Reference: https://github.com/cobbr/Covenant/wiki/Launchers.

4. Download the launcher file generated using the launcher form.

5. Upload the launcher file on a target machine with windows installed and windows defender disabled.

6. Execute the launcher file on the target machine.

7. Verify that the connection between the grunt and covenant is established. 

   Reference: https://github.com/cobbr/Covenant/wiki/Grunt-Interaction.

8. Terminate gracefully

## Deliverable

As a deliverable, the candidate is expected to illustrate (best if in a README file) the suite developed and to motivate his/her technical choices. 

The candidate should send the source code (preferably in a zip/tar.gz/other archive format) of the developed solution within the abovementioned deadline.

## Notes

There's no single valid solution to the challenge: its purpose is to evaluate the reasoning behind the technical choices made.
You can make use of any Open Source code available in the community, but please mention it. In case of any doubts, feel free to contact us at any time.

## Additional Technical Notes
1. Covenant and the pipeline should be hosted using 2 separate Docker containers.
2. The target machine can be simulated using a Windows 10 VM (https://developer.microsoft.com/en-us/windows/downloads/virtual-machines/)
3. In order to interact with the Windows VM the candidate can use the protocol he/she prefers: ssh, rdp etc. 

In case of any doubts, feel free to contact us at any time.