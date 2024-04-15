observability is one of the fundamental aspects of operational excellence. Its purpose is to provide insights into the operational status of systems and applications. It involves continuous monitoring and evaluating of that operational status. One of the primary targets of observability is performance. Performance monitoring-based observability could yield significant benefits to any organization that depends on technology for its revenue, including the one described in the sample scenario.

- In the context of observability, performance monitoring relies on collecting real-time telemetry, such as metrics, logs, and traces to evaluate the overall health of your workloads
- **Metrics** contain quantitative data, logs offer detailed information about events, and traces enable data correlation across distributed systems. To perform the evaluation, you also need to develop a health model, representing the operational status of the workloads under normal working conditions. Performance monitoring uses the health model to detect anomalies, performance bottlenecks, and performance-related issues as soon as they occur.
- Data collected through performance monitoring is also essential in incident response. It provides a detailed status of the affected workloads prior to, during, and after the incident, which simplifies troubleshooting and helps minimize mean time to resolution (MTTR). Other metrics that help assess effectiveness of performance monitoring include:

 **Time to detect (TTD)**: measures the time it takes for the diagnostic data about an incident to reach development and operations teams.

**Time to mitigate (TTM):** measures the time it takes development and operations teams to act on the monitoring information and mitigate the impact of the incident.

**Time to remediate (TTR):** measures the time it takes development and operations teams to resolve the root cause of the incident.


- SRE relies on explicit definition and measurement of reliability through quantifiable Service Level Objectives (SLOs) that determine the acceptable level of service characteristics, such as availability, latency, or error rates.

- Service Level Indicators (SLIs) are used to measure different aspects of the service's behavior that affect reliability.

- Service Level Agreements (SLAs) reference SLIs to define the acceptable performance. The SLAs serve as the foundation for SLOs.

- The initial steps of your SRE implementation should include defining SLOs, establishing SLIs and SLAs, and setting up error budgets. The remaining steps include:

  Applying automation throughout software delivery process (although the focus of SRE is on automation of operational tasks, such as scaling, monitoring, and incident response).
 
  Setting up comprehensive monitoring and observability processes.
 
  Defining incident management processes.
  
  Defining change management processes.
 
  Planning proactively for capacity needs.
  
  Promoting continuous learning and continuous improvement through regular post-incident reviews and root cause analysis. Regularly review SLOs, error budgets, and operational practices.
  
  Integrating SRE practices with development processes.
  
  Fostering communication between the SRE team and other stakeholders.
  

 Platform engineering is a practice that aims to enhance the developer experience by improving security, compliance, costs, and time-to-business value through self-service and a secure, governed framework

- 