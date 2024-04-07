what is Helm ?

>> Helm Is a package manager of kuberentes. it helps us to manage kubernetes applications. helm Charts help you to define, install, and upgrade even the most complex kubernetes application.

>> Charts are easy to create , version , share and publish

**********************************Helm Components :**********************************

- helm cli → installing chart, upgrading,
- when a chart is installed in a cluster a ****************release**************** is created.
-charts are a collection of files
- A release is a single release of an application using a helm-chart
- Each release is like a revision and each revision is like a snapshot of an application.
- Helm stores it's meta data in the form of secrets on top of our cluster
  
**Helm Release:**
  -  $ helm install [release-name][chart-name]
  - we can release multiple releases based on single chart