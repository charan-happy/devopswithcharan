Linux Networking Commands Cheat Sheet  
  
| Command      | Description                                                | Example Command                | Example Output/Usage                           |  
|--------------|------------------------------------------------------------|--------------------------------|------------------------------------------------|  
| ping         | Tests host connectivity.                                   | ping google.com                | Sends ICMP echo requests to google.com        |  
| traceroute   | Traces packet routes to a destination.                     | traceroute google.com          | Shows hops to google.com                       |  
| mtr          | Combines ping and traceroute for diagnostics.              | mtr google.com                 | Live route and latency to google.com           |  
| curl         | Transfers data to/from servers (HTTP, FTP, etc.).          | curl -I https://example.com     | Fetches HTTP headers from example.com           |  
| wget         | Downloads files from the web.                              | wget https://example.com/file.txt| Downloads file.txt from example.com            |  
| ip           | Manages network interfaces and routing.                    | ip addr show                   | Shows all assigned IP addresses                |  
| ss           | Displays socket statistics (modern netstat).               | ss -tuln                       | Lists listening TCP/UDP ports numerically      |  
| nmap         | Scans for open ports and services.                         | nmap 192.168.1.1               | Scans open ports on target                     |  
| tcpdump      | Captures/analyzes network packets.                         | tcpdump -i eth0 port 80        | Captures HTTP traffic on ethe                   |  
| dig          | Queries DNS for domain details.                             | dig example.com                | Shows DNS info for example.com                 |  
| nslookup     | Resolves DNS queries.                                      | nslookup example.com           | Resolves example.com to IP address             |  
| host         | Simple DNS lookup utility.                                 | host github.com                | Displays DNS information for github.com        |  
| nmcli        | Manages NetworkManager for configuration.                  | nmcli con show                 | Lists network connections                      |  
| lsof         | Lists open files (including network sockets).              | lsof -i :80                    | Shows processes using port 80                  |  
| nc (netcat)  | Debugs networks and transfers data.                       | nc -l 12345                    | Listens on port 12345                          |  
| ethtool      | Displays/configures NIC settings.                          | ethtool eth0                   | Shows info/settings for etho                   |  
| nload        | Visualizes real-time network traffic.                      | nload eth0                     | Shows traffic stats for etho                   |  
| iftop        | Monitors bandwidth usage by connection.                   | iftop -i eth0                  | Displays bandwidth by host on etho              |  
| iptables     | Configures firewall rules.                                  | iptables -L                    | Lists firewall rules                           |  
| ufw          | Simplified firewall management.                            | ufw allow ssh                  | Allows SSH through firewall                    |  
| netstat      | Shows network connections and ports (legacy).              | netstat -tulnp                 | Lists all listening ports and connections      |  
| ifconfig     | Configures/displays net interfaces (legacy).               | ifconfig eth0                  | Shows config for eth0 interface                |  
1. computer Networking
- Explain how a computer network and data transmission functions.
- Identify and differentiate between networks based on their types and topologies.
- Recognize what an internet protocol is and what purpose it serves.
- Describe the concept and practical uses of IP addresses.

# What is Network Architecture and Network Types ?

what is Network ?

Network is a group of **connected devices** that **communicate** each other by **sharing** a single / group of resources

 Networking is the fundamental component of modern computing

. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/355736d2-e71b-41dc-a6d8-03ca60eafbd8/Untitled.png)

Most commonly used  types of networks

 1.PAN (Personal Area Network)

1. LAN (Local Area Network)
2. MAN (Metropolitan Area Network)
3. WAN (Wide Area Network)
4. SAN (Storage Area Network)
5. VPN (Virtual Private Network)

## Local area network (LAN)

A local area network, or LAN, is a network that connects devices within a small area, such as a home, office, or school. LANs can be wired or wireless, and the bandwidth and the number of devices connected to a LAN network depend on the router's capacity.

### Advantages of LAN

- Easy to set up and maintain.
- Fast data transfer speeds.
- Secure because it's in a limited area.
- Can be used to share resources like printers, files, and internet connections.

### Disadvantages of LAN

- Limited range.
- Data transfer rate and capacity depend on the router.
- High installation and maintenance costs for wired LANs.
- May pose security risks if not properly checked.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1325b960-dca6-4d67-a0d2-93c7464a8708/Untitled.png)

## Wireless local area network (WLAN)

WLANs allow devices to connect to the internet or each other without using cables or wires. This flexibility makes them a convenient way to access the internet. WLANs are commonly found in public spaces like airports, cafes, and libraries, as well as in homes and offices. They use a wireless access point (WAP) to connect devices to the network and can support various devices like laptops, smartphones, and tablets.

### Advantages of WLAN

- Provides wireless connectivity, allowing for greater mobility and flexibility.
- Easier to set up and expand compared to wired networks.
- Can be less expensive than wired networks, especially in areas where cabling is difficult or impossible to install.
- Allows for easy access to the internet and network resources from multiple devices.
- Supports multiple users simultaneously.

### Disadvantages of WLAN

- Limited range and signal strength compared to wired networks, requiring additional access points for larger areas.
- Security risks due to the wireless signal being accessible to anyone within range, requiring strong encryption and authentication measures.
- Slower speeds compared to wired networks, especially over longer distances or when multiple users are connected.
- May require additional equipment and maintenance, such as repeaters and signal boosters, to maintain connectivity and performance.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ba15c1c5-8c71-46c8-855a-e2aa855e4058/Untitled.png)

## Wide area network (WAN)

A Wide Area Network (WAN) covers a vast area, connecting hundreds and thousands of local area networks (LANs) in separate places. The internet is an excellent example of a WAN. As you may recall, WANs utilize various methods like leased lines, satellites, and wireless networks to connect the LANs to the main network.

### Advantages of WAN

- Enables communication and sharing of resources across large distances.
- Allows for remote access and collaboration.
- Can improve efficiency and productivity in a distributed organization.
- Keeps working if there is a failure in one part of the network without affecting the overall performance of the system.

### Disadvantages of WAN

- Needs expensive, high bandwidth, and dependable connections.
- Could face security threats and attacks over public connections.
- Troubleshooting and maintenance over a large area can be challenging.
- Performance and user experience could be affected by network congestion and latency.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4e4ff2f9-583d-4ccc-8148-c3e718dae1b0/Untitled.png)

## Metropolitan area network (MAN)

This is a type of network that connects multiple LANs within a city or metropolitan area. MANs are used to provide high-speed connectivity for organizations that have multiple locations across a city. Large business entities or government agencies typically use them.

### Advantages of MAN

- Allows communication among devices over a larger geographic area than a LAN.
- High-speed data transfer capability.
- Provides centralized management of network resources.
- Enables remote access and collaboration between employees at separate locations.
- Can be customized to fit the specific needs of an organization.

### Disadvantages of MAN

- Can be expensive to install and maintain.
- May require specialized knowledge and expertise to manage.
- Can be vulnerable to security breaches if not properly secured.
- May experience performance issues due to network congestion or distance between locations.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cbc00936-8aaf-40ed-95bd-a4481fe71efc/Untitled.png)

## Storage area network (SAN)

Storage Area Networks (SANs) are commonly used in enterprise-level environments to provide fast and reliable storage for many servers and applications. Let's explore where SAN systems can add value.

Banks and financial institutions need to store and access large amounts of data for their day-to-day operations. SANs are commonly used to provide fast and reliable data storage, including customer information, financial transactions, and more.

Hospitals and other healthcare facilities generate and store a significant amount of data, including patient records, medical images, and other resources. A SAN can be used to provide storage for this data, which is critical for patient care and research.

And media and entertainment companies such as movie studios, television networks, and streaming services generate and store a vast amount of digital content. A SAN can be used to provide fast and reliable storage for this content, which is critical for content delivery and post-production workflows.

### Advantages of SAN

- Provides fast, reliable, and centralized storage for a large amount of data.
- Can be easily scaled and expanded to accommodate growing storage needs.
- Allows for backup, disaster recovery, and business continuity solutions.
- Offers high-speed data transfers and improved performance for critical applications.
- Provides security and data protection with access controls and encryption.

### Disadvantages of SAN

- Can be complex and expensive to implement and maintain, requiring specialized hardware and software.
- May require dedicated IT staff for management and maintenance.
- Could be a single point of failure if not correctly configured for redundancy.
- Performance can be impacted if the network is not efficient.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/81f1526f-9785-4996-a6eb-08950522a693/Untitled.png)

## Other types of area networks

There are additional types of area networks that you should also be familiar with. In a cybersecurity career, you will work with many different kinds of networks, so it's vital that you know about the other types of networks discussed next.

### Personal area network (PAN)

You already know about PANs, which are small networks typically temporarily connecting personal devices. For instance, when you link your laptop and smartphone through Bluetooth or share the internet using hotspots, you are creating a PAN. This type of network can help simplify tasks by allowing devices to communicate with each other, and it's especially useful for people who are on the go and need to share files or connect to the internet quickly. However, PANs are limited in range, and devices need to be close to each other to work properly.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4abdd396-f195-49fd-922c-645af3f4aab4/Untitled.png)

### Desktop area network (DAN)

This is a type of computer network that connects multiple devices to one single device. For example, it connects printers, scanners, and external storage devices to a desktop computer, enabling them to be accessed and shared by multiple users. Like all other small area networks, DANs have limited range and capability and sometimes a slower data transfer rate.

### Tiny area network (TAN)

A TAN links devices in a small area, usually within a few meters of each other, such as in a room. It is designed to consume low power and is often used for smart homes and connecting wearable technology and internet of things (IoT) devices. TANs are similar to PANs and DANs because they have limited range and data transfer rates.

### Campus area network (CAN)

CANs connect multiple buildings within a small geographical area, such as a college campus, university, or office complex. A CAN is typically designed to provide high-speed connectivity between buildings and support many users. This type of network can be complex to set up and maintain, requiring specialized equipment and expertise.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5adbf8d0-698d-472b-ac22-2f1527fcc8f4/Untitled.png)

**Network Topologies**

- The term ******************topology****************** refers to the shape.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6f672ee3-9399-4f7d-9452-aa4bb4160a6b/Untitled.png)

**************************Bus Topology**************************

connected with a single cable.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e50404f7-3411-4dae-a536-d39e016c0721/Untitled.png)

- It works with broadcast mechanism

**Advantages :**

- Best for small network
- Simple and easy installation

******************************Disadvantages :******************************

- Single point of failure. If single cable fails whole network will fail.

Ring Topology :

Devices Connected in a loop

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/eaa60740-fef9-4df5-af5b-a88d324f9bef/Untitled.png)

- Devices are connected each other through connectors.

************************Advantages :************************

- High Speed
- Efficient

********Disadvantage :********

- one device failure whole network failure.

Star Topology :

Devices are connected to a central switch.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fdcac574-49ab-45ac-a700-2a5cb491e293/Untitled.png)

- It is the mostly used topology type in offices and homes.

****************Advantages :****************

- simple setup
- Good performance
- Easy troubleshooting
- Resilient

**********************Disadvantage :**********************

- Switch failure entire network will fail

Mesh Topology :

Devices are connected through interlocking nodes

******************Interlocking is nothing but a Each device connecting to multiple devices.******************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b6e20955-db3d-4864-a1a7-cbdb0b61a4bb/Untitled.png)

************************Advantages :************************

- Reliable
- No single point of failure

******************************Disadvantages :******************************

- complex
- Expensive

Tree Topology :

Central bus connected to sub-networks

Tree topology is also known as hierarchial Topology

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bba310f8-f00c-4611-8a49-e672939ee982/Untitled.png)

It is used to connect Medium to large networks

************************Advantages :************************

- It can easily be upscaled

**************************Disadvantages :**************************

- Central line failure, Network failure

Ring is replaced by switches (simultaneous communication) and routers(Does not allow simultaneous communication ) and bus is only using when we are using hubs

Now most hubs are replaced with switches in most of the networks.

The choice of topology depends upon the different factors like cost, availability, scalability and for specific purpose .

**********************Physical Topology :**********************

- A physical topology refers to how network devices are arranged and connected in a visible layout that can be observed from above.
- It’s similar to the map below that depicts buildings and the streets that connect them.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0846f327-f421-48c8-ab02-6f58eed82b52/Untitled.png)

The map provides the locations of all the buildings and identifies the different routes you can take to get to your chosen destination. 

A physical topology is similar , but instead of roads, you have data cables, and instead of buildings , you have computers and network devices.

- In short, we can use this physical topology to locate and troubleshoot a device if there is a problem.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/452c9aa7-fc6f-499b-9b27-fbfb63520749/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/882e9e81-19f7-4be9-9d80-1c6340006701/Untitled.png)

********************************Logical Topology********************************

- A logical topology refers to how data is transmitted across a network and the possible routes it can take to reach its destination. These routes are called ****************************************communication paths.****************************************

- ****************************************************************************The physical topology does not let you observe what is happening inside the devices. That’s why u need the logical topology to know the true path the data takes in a network.****************************************************************************

To give u a conclusion, ************************physical Topology************************ refers to network device’s actual layout and physical connections, **********************************logical Topology********************************** focuses on the paths data takes as it is transmitted through the network. 

- The physical and Logical topologies may be the same or the may differ depending on the network devices used. By considering both types of topology, you can design, troubleshoot , and optimize networks to ensure good performance, reliability and security.

**************************************Data Transmission :**************************************

The process of sending and receiving data over a network is called as ****************************************************data transmission process.****************************************************  Now, let’s have a look at it 

![Overview of Data Transmission](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b9d27774-c946-4398-9c77-78718e02bb88/Untitled.png)

Overview of Data Transmission

****************************************Preparing the data :****************************************

The First step in data transmission is creating the data that needs to be transmitted. This step can include text, images, video and audio files. The data is usually created on a computer or mobile device but can come from various sources.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/483ef96d-4889-4034-a6cf-b42caac15777/Untitled.png)

************************The Sender :************************

The next step is for the sender to initiate the transmission process. The sender is the device or computer responsible for creating and sending data over the network. To do this, the sender must be connected to a network that can transmit the data. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e369b171-37fd-49e9-b46a-327679bbd013/Untitled.png)

****************************************************Breaking data into packets****************************************************

Once the sender initiates the transmission process, the data is broken down into small units called packets. Each packet contains part of the original data and additional information necessary for transmission.

Breaking down the data into packets has 2 advantages. 

1. It allows the data to be transmitted more efficiently, as it can be sent in smaller units. 
2. It will transmit the data more reliably, as packets can be retransmitted if they are lost or corrupted in transit.

 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/69be5810-da26-4f3d-ad18-a1f0c9733250/Untitled.png)

********************************************Addressing the packets********************************************

Before the packets can be transmitted, they must be addressed. Each packet is assigned a unique address that indicates its destination on the network.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fe400c91-07a9-4a78-84f3-ef3d6a8ac5b1/Untitled.png)

************************************************Transmitting the packets************************************************

Once the packets have been addressed, they are transmitted over the network as frames. A frame is a simple container for all the data and IP information to be placed, ready for transmission on the network. 

The frames can be transmitted over wired or wireless connections, depending on the network type. Protocols such as TCP (Transmission Control Protocol ) ensures reliable transmission by retransmitting lost or damaged packets.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f6a9a08a-85c6-43aa-8303-bf75b2be02ca/Untitled.png)

**********Receiving the packets**********

As the frames are transmitted over the network, they are received by other devices on the network. These devices act as routers, switches, and other network devices, which direct the frames to their destination. 

Routers are used to direct traffic through the network, and transmission technologies include wired and wireless connections.

******************************************Reassembling the data******************************************

once all the frames have been received, the receiving device must reassemble them into the original data packets. the additional information in the packets determines the order in which they should be reassembled and delivered to the user.

**************************************Delivering the data**************************************

Finally , the data is delivered to the intended recipient. This delivery can happen in various ways, depending on the application used. For ex : the data could be displayed on a web page, played as an audio or video file, or saved as a document.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b5bedd34-fa57-499f-924d-6c90c9a3a54e/Untitled.png)

************************************Security Concerns :************************************

Eavesdropping is a method where third parties intercept and listen to private conversations or data exchanges.

Data tampering is when someone alters the data during the transmission process. 

Phishing is a type of social engineering attack that aims to deceive users into sharing confidential information, such as login credentials

Malware is a malicious software that infects and compromises a network or device

**Solutions :**

Encrypting data, Using of VPN, Implementing a firewall and using a strong passwords.

************************IP address :************************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c79affba-8fc9-45ee-b1ce-518ce12e95a7/Untitled.png)

**********************IP Address********************** is simply identifies a device on the network on which we can transfer data .

Every device’s IP address in a network is divided into 4 groups of numbers. Each separated by a period.

Every ip address is divided into 2 parts. 1. Network location 2. Device (Host) location

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/822c5abe-33cc-4195-bd4c-4476e2686cbf/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/2bf374e2-f5ed-4702-ac1f-dff05b525ce9/Untitled.png)

EX : 192.168.0.1

Here 192.168 is network part (Specify network class)

0.1 is host/device part (Unique within a network )

Devices addresses can be range from 1 to 255.

IP protocol uses ************************subnet mask************************ to identify the network and host part of the IP address.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/80c8b3a7-1279-472c-b373-51f95901c886/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/50d89fa2-c869-4c9f-8404-e4e2b46577d1/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4eee958b-d5a6-45d2-801c-b650fe7b00c2/Untitled.png)

**************subnets**************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0bd301b9-fc8d-418f-b0a6-15654be5b63c/Untitled.png)

By Segmenting networks into subnets, we can improve ****************************************************************************security, Performance, easier to manage****************************************************************************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/77953d8a-0602-48a9-9bcb-ffa6ee1737b6/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e7b7d7ea-f8a6-402b-a813-3995bb236232/Untitled.png)

A default gateway tells network devices the IP address of the router.

Networks are divided into smaller networks called as **subnets .** 

****Routers**** are used to route the packets across the network.

Devices sent data intended for other network ip default gateway.

**********************************************How does a device get its IP Address ?**********************************************

**Static IP address assignment**

You know that IP addresses are used to identify devices on a network and that subnet masks help determine whether a device is on the same or a different subnet compared to the sender's device. You also learned that a network needs an IP default gateway for devices to find the nearest router to route IP packets between networks. All of this addressing needs to be configured on the network devices.

When you perform IPv4 configuration, you must configure the following:

- IPv4 address
- Subnet mask
- Default gateway

**Dynamic IP address assignment**

The automatic configuration of IP address information for network devices is called ****************************************Dynamic Ip address Assignment.**************************************** These can be done with the help of protocol called ************DHCP(Dynamic Host Configuration Protocol)************

**Public and private IP addresses**

Public Ip addresses only needed when you connect to the internet and are globally unique. These are typically assigned dynamically by an internet service provider (ISP) to give you an internet connection. It cannot use any of the private addresses in the ranges described below, as these are not unique.

| Class | Network Size | Range |
| --- | --- | --- |
| A | Large | 10.0.0.0-10.255.255.255 |
| B | Medium | 172.16.0.0 -
  172.31.255.255 |
| C | Small | 192.168.0.0 -
  192.168.255.255 |

Translating these private addresses to public only occurs when an internet connection is introduced to a network. A router takes care of address translation using network address translation (NAT).

| IPV4 | IPV6 |  |
| --- | --- | --- |
| 32 bits IP addressing | 128-bit IP addressing |  |
| Around 4 billion IP addresses | 7.9*10^28 times more Ip addresses than IPV4 |  |
| The structure is in decimal numbers | The structure is in hexadecimal called a hexadectet |  |
| EX: 192.168.1.1 | EX :  2001:db8::8a2e:370:7334 |  |
| High Transition speed | Slow Transition Speed |  |
| It Uses broadcast traffic to find devices on the network | It uses multicast traffic |  |
| It only supports unicast | It supports both Unicast and anycast (It is an address that can be assigned to multiple devices worldwide) |  |

# **Implement automatic IPv4 addressing**

It's important that you know how to assign static IPv4 addresses manually and support devices that use DHCP to assign IPv4 addresses dynamically.

!https://learn.microsoft.com/en-us/training/wwl/configure-ip-network-connectivity/media/automatic-ipv4-addressing-a5ba420b.jpg

## **Static configuration**

You can configure static IPv4 configuration manually for each of your network’s computers. When you perform IPv4 configuration, you must configure the:

- IPv4 address
- Subnet mask
- Default gateway
- Domain Name System (DNS) server

Static configuration requires that you visit each computer and input the IPv4 configuration. This method of computer management is time-consuming if your network has more than 10 to 12 computers. Additionally, making a large number of manual configurations heightens the risk of mistakes.

IP addressing  Types

1. Dynamic IP ( DHCP server )
2. Static IP ( Assigning Ip address Manually )
3. Self assigned (APIPA - automatic private address assignment )

The scope in DHCP is a group and a range of consecutive IP addresses for computers that gets their IP addresses from DHCP Server.

## **DHCPv4**

DHCPv4 enables you to assign IPv4 configurations automatically for a large number of computers without having to assign each one individually. The DHCP service receives requests for IPv4 configuration from computers that you configure to obtain an IPv4 address automatically. It also assigns IPv4 information from scopes that you define for each of your network’s subnets. The DHCP service identifies the subnet from which the request originated, and assigns IP configuration from the relevant scope.

DHCP helps simplify the IP configuration process. However, keep in mind that if you use DHCP to assign IPv4 information and the service is business-critical, you must:

- Include resilience in your DHCP service design so that the failure of a single server does not prevent the service from functioning.
- Configure the scopes on the DHCP server carefully. If you make a mistake, it can affect the whole network, and it can prevent communication.

## **IPv4 alternate configuration**

If you use a laptop to connect to multiple networks, such as networks at work and at home, each network might require a different IP configuration. Windows supports the use of Automatic Private IP Addressing (APIPA) and an alternate static IP address for this scenario.

When you configure Windows devices to obtain IPv4 addresses from DHCP, use the Alternate Configuration tab to control the behavior if a DHCP server is not available. By default, Windows uses APIPA to assign itself an IP address automatically from the 169.254.0.0 to 169.254.255.255 address range. This enables you to use a DHCP server at a location with DHCP and the need for internet access and the APIPA address range a location without DHCP but the need to communicate between computers (such as a workgroup), without reconfiguring IP settings. Additionally, this is useful for troubleshooting DHCP. If the computer has an address from the APIPA range, it is an indication that the computer cannot communicate with a DHCP server.

# **Examine tools for troubleshooting network connections**

Windows includes a number of tools that you can use to diagnose network problems, including:

- Event Viewer
- Windows Network Diagnostics
- IPConfig
- Ping
- Tracert
- NSLookup
- Pathping
- Windows PowerShell

## **Event Viewer**

**Event logs** are files that record significant events on a computer, such as when a process encounters an error. IP conflicts are reflected in the system log and might prevent services from starting. When these events occur, Windows records the event in an appropriate event log. You can use Event Viewer to read the log. When you troubleshoot errors on Windows, you can view the events in the event logs to determine the cause of the problem.

You can use Event Viewer to access the Application, Security, Setup, and System logs under the Windows Logs node. When you select a log and then select an event, a preview pane under the event list contains details of the specified event. To help diagnose network problems, look for errors or warnings related to network services in the System log.

## **Windows Network Diagnostics**

In the event of a Windows networking problem, the Diagnose Connection Problems option helps diagnose and repair the problem. Windows Network Diagnostics then presents a possible description of the problem and a potential remedy. The solution might require manual intervention from the user.

## **IPConfig**

The **IPConfig** command displays the current TCP/IP network configuration. Additionally, you can use **IPConfig** to refresh DHCP and DNS settings. For example, you might need to flush the DNS cache. The following table provides a brief description of some of the **IPConfig** command switches.

**Command**

**Description**

**ipconfig /all**

View detailed configuration information.

**ipconfig /release**

Release the leased configuration back to the DHCP server.

**ipconfig /renew**

Renew the leased configuration.

**ipconfig /displaydns**

View the DNS resolver cache entries.

**ipconfig /flushdns**

Purge the DNS resolver cache.

**ipconfig /registerdns**

Register/update the client’s host name with the DNS server.

## **Ping**

You use the **Ping** command to verify IP-level connectivity to another TCP/IP computer. This command sends and receives Internet Control Message Protocol (ICMP) echo request messages, and displays the receipt of corresponding echo reply messages. The **Ping** command is the primary TCP/IP command used to troubleshoot connectivity.

**Note**

Firewalls might block the ICMP requests. As a result, you might receive false negatives when using **Ping** as a troubleshooting tool.

## **Tracert**

The **Tracert** tool determines the path taken to a destination computer by sending ICMP echo requests. The path displayed is the list of router interfaces between a source and a destination. This tool also determines which router has failed, and what the latency, or speed, is. These results might not be accurate if the router is busy, because the router will assign the packets a low priority.

## **Pathping**

The **Pathping** command traces a route through the network in a manner similar to the Tracert tool. However, **Pathping** provides more detailed statistics on the individual steps, or hops, through the network. The command can provide greater detail because it sends 100 packets for each router, which enables it to establish trends.

## **NSLookup**

The **NSLookup** tool displays information that you can use to diagnose the DNS infrastructure. You can use the tool to confirm connection to the DNS server, in addition to the existence of the required records.

## **Windows PowerShell**

You can use Windows PowerShell to configure network connection settings. In addition to this, you can use Windows PowerShell cmdlets for troubleshooting network settings.

1. Network Devices and protocol
- Describe a virtual environment and the network that supports it.
- Explain the process of data transmission across a network.
- Recognize basic information protocols and ports.
- Describe what network monitoring is and what it entails.
    
    Hybrid Network has a flexibility ,upscaling feature, 
    

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9f902987-740b-4919-a80e-6079d684f907/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6de5a681-22c4-4d38-a919-840bfaefc459/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ddd008e1-3c6f-4552-b607-a9571aff387a/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/10e80c01-5c92-41dd-b2b1-38f9884aa4db/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ad3da81e-d9d9-4abd-b96e-66fd171437f9/Untitled.png)

****************Internet****************

The internet was first created on 1969. Due to increase in computers count, Sir Timothy Berners-Lee in 1989 created WWW along with HTML.

**************Internet service Providers (ISPs) :**************

The internet is vast, and no single person, business owns it. It has become something that everyone can use despite their location because there are so many connected networks. But how do those networks connect to one another ? This is where internet service providers or **************ISP ,************** plays a role.

**********ISPs********** rely on partners in other areas of the world to deliver information to recipient’s homes. Because **********ISPs********** are all interconnected, they can pass each other’s data across their own infrastructure.

**************************************************************************************ISPs allow you to get online and connect in a few different ways, as listed below.**************************************************************************************

Broadband is provided either through fiber cables or phone lines. It’s a high-speed internet connection that is widely used today.

Wireless connection - wi-fi and mobile service providers fall under this category. With this kind of connection, internet connectivity is made up of radio waves, and the internet can be connected anywhere, irrespective of the location, as long as it’s in range. Below is the examples of wireless connections .

WIFI - wireless fidility or Wifi allows high speed internet connectivity without the use of wires

Mobile Phones - Mobile phones are now equipped with an option for internet connectivity via a contract.

https://www.quora.com/How-does-an-ISP-get-an-Internet-connection

For many of these connections, you need a device from the service provider to connect the technology to your home. This device could be a router, a modem, or in the case of a mobile phone, a simcard.

**********ISPs********** build networks using switches and routers.

The idea behind the concept of ********IOT******** is to integrate everyday things that you use to collect data. That data can be used to report on what is happening, to learn and also to may be trigger an action.

********IOT******** comprises three components. The device / sensor , communication and back-end services.

******************************************Network Communication Models :******************************************

- The flow of communication  over a network in terms of  a model.

OPEN SYSTEMS INTERCONNECTION (OSI) Model.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e9754641-0172-4ec9-a895-2977003f6695/Untitled.png)

It also make sure the communication between devices consistent and efficient way .

- It was introduced in 1978 , it describes networking as a series of protocol layers with specific functions allocated to each layer, Each layer offers specific services to higher layers, while hiding the details of the implementation of those services.
- The OSI model is an essential framework for understanding how communication occurs between different network devices because it offers a standardized approach to network communication.
- For the network communication , there is a requirement for set of standards, that’s why we have ********************osi model********************
- OSI Model describes how information from software in one computer routes through software in an another computer.
- It describes the task of data communication by breaking down into 7 layers.
- It consists of 7 unique layers.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/554acc9d-ffc0-4c5b-9b97-2d6f8804f52c/Untitled.png)

********************************Physical Layer :********************************

- Converts data to wireless or electrical signals.
- This layer defines the network standards and physical characteristics of  a network such as connectors , media types , cables ,voltages etc
- Defines the topology of a network.

********************************Datalink Layer :********************************

- Ensures reliable and error-free data
- This layer is responsible for sending data to the physical layer
- data packets are encoded & decoded into bits
- Handles flow control & frame synchronization
- divided into 2 sub-layers, the Media access control (MAC)  layer and the logical link control (LLC) layer.

******************************Network Layer :******************************

- selects the best path
- This layer is responsible for routing the data packet based on it’s logical IP address.
- It fragments & reassembles the packets
- Instructs data on how to find its ultimate destination

**********************************Transport Layer :**********************************

- Establishes reliable connections
- This layer provides the transfer of data between end user
- Responsible for resending any packets that do not receive on acknowledgment from its destination
- This layer can gurantee that packets are received

******************************Session Layer :******************************

- Manages communication sessions
- This layer controls the dialogue during communications
- It establishes ,manages & terminates the connections between local and remote applications known as “traffic cop” because it directs network traffic

****************************************Presentation Layer :****************************************

- Formats data so it is recognizable by applications
- This layer is where data is first converted into a form that can be sent over a network
- data is compressed & decompressed and encrypted or decrypted.
- Sometimes it is referred as the translation layer.

******************************Application Layer :******************************

- Provides interface by which users can access the network
- This layer is to manage communication between applications and supports application protocol such as email, HTTP & FTP
- At this layer data resembles something that people can read.

************Advantages :************

Organized Structure

Standardized

Flexibility

 ******************************Disadvantages :******************************

Complex

Theoretical

Slower Transmission

Time Consuming

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1bac7b20-6a6c-49fd-8a1d-9652013f38ad/Untitled.png)

********************************************Layered Architecture :********************************************

- Layered Architecture has been the standard approach to networking for many years because it enables you to break a very complex process into smaller process. This allows IT professionals to focus on specific steps in Isolation from other steps, and when changes are necessary, it does not affect other steps.

- There are many different models based on layered architecture. Models are helpful for interpreting processes that users interact with all the time without even being aware of the underlying steps or layers involved.
- The principle behind layered architecture is the ************************************************separation of concerns.************************************************ This means that as much as possible, layered models structure similar tasks together and separate them from unrelated parts of a process or application.
- ************separation of concerns************ ensures the modularity, flexibility, and maintainability.

**TCP/IP Model** 

- TCP/IP is the primary protocol used all over the world by millions of devices to send information online on different kinds of networks.
- let’s think a big post is broken down into small packets and sent to their destination.  Data is broken down into smaller packets so that mulitple computers can send data each taking quick returns.
- It also increases the transmission rates by not clogging up the line.
- ******************************************IP/internet protocol****************************************** ensures the packets get to the right destination and the **transmission control protocol or TCP** makes sure that the packets arrive safely and in the correct order.
- In these way, even if some packages get lost along the way, TCP will send them again to make sure the information gets to its destination intact.
- The data transmission in TCP/IP involves several steps to make sure that the data gets to the right place in perfect form, and these steps happen in different layers.
    - First, data is divided into smaller parts called packets, before being sent over the network. These packets then travel over the network, which may be physical wires or wireless signals to reach their destination.
    - The next step is reception of packets, the destination device collects all the packets and puts them back together to recreate the original data. But, sometimes data can get lost along its journey.
        - The next step is to make sure all the packets are correct and have arrived in the right order, for this reason, the TCP protocol adds extra information to each segment of data known as ************************************************************************************sequence number and acknowledgment number.************************************************************************************
        - The sequence number is the order of the packets and the acknowledgment number is used to check if they arrived. If any of the parcels get lost an acknowledgment is not sent back to the receiver. After a time-out period, the sender will note it has to send the packet again. When delivered successfully , an acknowledgment will be sent back to close the process.
        - But, TCP delivery check process can only happen once devices have found each other over the network, and this happens next with the IP protocol.
        
        In essence, the data with all the applied TCP/IP protocols is a signal that is sent across cables or wirelessly to its destination. These signals are in the form of zeroes and ones known as binary.
        
        The four layers in TCP/IP model are ****************************************************1. Application layer 2. Transport layer 3. Internet layer 4. Network interface or data link layer****************************************************
        
        - The bottom layer is the network interface or data link layer and is physical link between the computer and the network. It is responsible for sending and receiving data over the network using hardware such as network adapters.
        - The next layer, the Internet layer, forwards packets from the source to the destination.
        - The transport layer works in the background and ensures that the data is sent reliably, meaning all data packets are verified by the TCP protocol, but this takes time.
        - The top layer, the application layer deals with the applications running on the devices and the data that they generate. In other words, it provides an interface for the user to access network resources.
        
        Tcp allows multiple processes to happen simultaneously, it’s called multiplexing and means that different devices can send and receive data at the same time over the same connection.  It can also handle different data types such as emails, websites and videos.
        

******************TCP/IP vs OS******************

| OSI Model | TCP/IP Model |
| --- | --- |
| It provides Blueprint for how information can be broken  down into its simplest components, transported over a physical connection | TCP/IP model is the physical implementation |
| Seven layers involved | Only four layers involved |
| It has more precise division of tasks between layers | It has less distinction between interfaces, services and protocols |
| It is More theoretical and structured | It is more practical and widely used in real world applications |

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/440f1481-2096-4b11-93ef-fac3eb9d5518/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bfef0a91-f339-4433-84dd-175a4a08f800/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d55d0472-867e-4ba4-a21a-9eddd66f36bd/Untitled.png)

******************Protocols and ports******************

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dc36192a-be5e-48a0-95c2-a52e5f1e9739/Untitled.png)

—> ports are like the gates at an airport, controlling what data can pass through and where it's going. By managing and securing the range of port numbers, you can keep unwanted access out of your network. 

********************Protocols******************** 

**************************************Network Protocols :**************************************

- when it comes to computer networking, network protocols act as the language that allows devices to communicate with each other. Network protocols provide a common language that enables different devices to talk to each other and share information.

**********************************How does it work ?**********************************

- A network protocol is a set of conditions and rules that specify how network devices communicate on a given network. For example, when you use a web browser like Microsoft edge to visit web pages, it uses protocol to deliver the data to the browser.
- protocols provide a standard framework for establishing and maintaining communication channels and for handling errors or faults should they occur.  This allows communication between different network enabled devices like laptops, tablets, smartphones, desktops and servers, making network protocols essential building blocks for designing an organization’s network architecture.
- Various types of applications and hardware devices depend on specific network protocols on a typical network. for ex, browsing the internet using a web browser requires a different protocol than sending or receiving an email. Each protocol has unique properties that govern its use and implementation.

Network protocols can be grouped into three categories :

- ******************************************Network communication protocol******************************************
- **************************************************Network Security protocol**************************************************
- ******************************************************Network Management protocol******************************************************

******************************************************Network communication protocol :******************************************************

- communication protocols focus on establishing and maintaining a connection between devices. As you work with different devices and network services, you’ll need to use various communication protocols.
- There are several commonly used network communication protocols include:
    - **********************************************Hypertext Transfer Protocol (HTTP)********************************************** the HTTP protocol uses TCP/IP to deliver web page content from a server to your browser. HTTP can also handle the download and upload of files from remote servers.
    - **********************************************File Transfer Protocol (FTP)********************************************** it is used to transfer files between different computers on a network. Typically, FTP is used to upload files to a server from a remote location. While you can use FTP to download files, web-based downloads are typically handled through HTTP. ********************************************************************************************
    - **********************************************Post office Protocol3 (POP3)**********************************************• POP3 is one of three email protocols. It's most commonly used by an email client to receive emails and it uses TCP to manage and deliver emails.
    - **********************************************Simple Mail Transfer Protocol (SMTP)********************************************** SMTP, another email protocol, is used to send emails from an email client via an email server and it uses the TCP for managing and transmitting emails.
    - **********************************************Interactive Mail access protocol (IMAP)********************************************** IMAP is the more powerful of the three email protocols. It lets you manage a single mailbox on an email server in your organization using an email client

******************************************************Network Security Protocol :******************************************************

- Network security protocols are designed to maintain the security and network of data across a network. Encryption is a key feature of network security protocols, which involves converting plain text into encoded, unreadable text to protect messages as they travel across the network. These protocols use encryption to secure messages and prevent unauthorized access or tampering.

To implement a secure network, it's important to select the right security protocols based on your specific needs.

The following list explores the leading network security protocols:

- **Secure Socket Layer (SSL)**: SSL is a standard encryption and security protocol. It provides a secure and encrypted connection between your computer and the target server or device that you accessed over the internet.
- **Transport Layer Security (TLS)**: TLS is the successor to SSL and provides a stronger and more robust security encryption protocol. Based on the Internet Engineering Task Force (IETF) standard, it's designed to stop message forgery and tampering and eavesdropping. It's typically used to protect web browser communications, email, VoIP, and instant messaging. While TLS is now used, the replacement security protocol is often still called SSL.
- **Hypertext Transfer Protocol Secure (HTTPS)**: HTTPS provides a more secure version of the standard HTTP protocol by using the TLS or SSL encryption standard. This combination of protocols ensures that all data transmitted between the server and the web browser is encrypted and secure from eavesdropping or data packet sniffing. The same principle is applied to the POP, SMTP, and IMAP protocols listed previously to create secure versions known as POPS, SMTPS, and IMAPS.
- **Secure Shell (SSH)**: SSH is a cryptographic network security protocol that provides a secure data connection across a network. SSH is designed to support command-line execution of instructions, which includes remote authentication to servers. FTP uses many of the SSH functions to provide a secure file transfer mechanism.

****************************************************Network Management Protocols****************************************************

Network management protocols play a critical role in ensuring the smooth operation and sustainability of a network. Alongside communication and security protocols, they enable network administrators to monitor and manage devices and detect faults or performance issues.

To achieve effective network management, administrators must continually monitor all devices on the network. These devices provide indicators about their state and health, which can be accessed using specialized network administrator tools.

Two popular network management protocols are Simple Network Management Protocol (SNMP) and Internet Control Message Protocol (ICMP).

- **Simple Network Management Protocol (SNMP)**: SNMP is an internet protocol that allows for the collection of data from devices on your network and the management of those devices. The device has to support SNMP to gather information. Devices that typically support SNMP include switches, routers, servers, laptops, desktops, and printers.
- **Internet Control Message Protocol (ICMP)**: ICMP is one of the protocols included within the Internet Protocol (IP) suite. It allows network-connected devices to send warning and error messages, along with operation information about the success or failure of a connection request, or if a service is unavailable. Unlike other network transport protocols like UDP and TCP, ICMP isn't used to send or receive data from devices on the network.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/c5ab67fa-8525-47cb-a1e6-583aafa38b05/Untitled.png)

******************Vulnerabilities :******************

Network communication protocols are necessary to connect devices, but they also present risks. The main problem is that data transfers can be intercepted, and this vulnerability applies to all network communication protocols.

With traffic crossing the internet, there are even more opportunities for attackers to intercept data, and this is known as a Man in the Middle attack

Just like HTTTP has been upgraded to HTTPS, many protocols have been changed or updated to deal with different vulnerabilities.

port numbers can be used to identify protocols, and the protocols set rules for how network devices communicate.

→ Port number 25 is called as the port of the email. 

********************port number ranges :********************

- The range of port numbers used globally is from 0 to 65,535
- which is a vast number range. The Internet Assigned Numbers Authority (IANA) manages these port numbers since they change over time as technology and protocols evolve. Any changes made to these port numbers require IANA's permission.

The port numbers are further divided into three ranges, each serving a slightly different purpose in the network. The classification is important in identifying different sessions across a network between devices.

The three port number ranges are:

- **Well-known ports** (0-1,023) are reserved for specific protocols and services used by system processes and applications.
- **Registered ports** (1,024-49,151) are assigned by IANA for specific services or protocols and can also be used by user applications.
- **Dynamic or private ports** (49,152-65,535) are used by client applications to connect to servers and are assigned temporarily for the duration of a session.
- devices use different port numbers to manage network traffic. Well-known ports are for common applications, registered ports for constantly changing protocols and newer technologies, and dynamic ports for identifying individual sessions. Engineers manage network traffic by configuring and monitoring data flow through specific port numbers, assigning them to specific applications or services, setting up firewall rules, and analyzing network traffic to improve performance.

By managing network traffic effectively, engineers ensure data is transmitted securely and efficiently, and applications and services are accessible to users.

******************************Routing table :******************************

- Routing table is a file that contains a set of rules that shows information on what path a data packet takes to its destination
- The router looks at its routing table to find out where to forward the data packet along the best path to its final destination.
    
    ********Network destination :******** The Ip address of the final destination
    
    ****************************Subnet Mask :**************************** Determines which part of the IP address is the host and network portion
    
    ********************Gateway :******************** Tells the router which IP address the data packet should be forward to
    
    **********************Interface :********************** The outgoinig IP address of the device that’s sending the data
    
    **********Next hop :********** The Ip address to which the IP address is forwarded to
    
    **********Metric :********** Determines the best route among multiple destinations
    

************************************Routing Protocol :************************************

- Routing protocol collect information about the current network status and map out best path for data packets to talk to their specific destination.

3 types of Routing protocols :

1. Distance Vector ( Factors in distance to the destination based on how many hops) **********EX :********** RIP ( Routing information protocol ) BGP(broader gateway protocol )
2. Link state (A routing protocol that is used by routers to share information & independently map out the best path on a network) ********EX:******** OSPF, IS-IS
3. Hybrid

********Firewall :********

- can be either software/hardware
- Designed to prevent unauthorized access from entering a private network
- Blocks unwanted traffic and permits wanted traffic

Firewall types ;

1. Host based firewall
2. Network based firewall 

1. Host based firewall :

- It is a software based firewall
- Installed on computers and it only protects it.
1. Network based firewall
    - It is both software and hardware
    - It protects anything

Firewall works based on ACL (access control list )

********stateful vs stateless firewall********

- firewalls inspect traffic in a couple of different ways

**********************stateful :********************** 

- Monitors all the connections & data streams that are passing through.
- Keeps record
- does a thorough job of protecting a network dynamically.

**********************stateless :**********************

- doesn’t do a thorough job
- uses an ACL to allow or deny traffic
- Doesn’t keep record
- It is permanent

****************************Proxy and Reverse Proxy servers ;****************************

**************Proxy :**************

- A proxy is someone or something that has authority to do something for another person or thing
- A proxy server is the middleman that sits between private network and public network
- The major benefit of proxy is that it can regulate traffic by blocking harmful websites
- It hides identity of the client by masking their IP addresses.
- It logs user activity
- It can bypass restricted content
- Increases speed  by caching(storing) copies of websites in its database.

**Forward proxy**

- Forward proxy regulates traffic going out of network
- Forward proxy is to protect client

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fca875d6-97c4-43e5-a7c8-c2f6696e69ef/Untitled.png)

Reverse proxy :

- Reverse proxy regulates traffic coming into a network
- Reverse proxy is to protect devices
- Increases the security by hiding the IP address of the servers
- Blocks malicious traffic such as DDOS attach
- Load balancing

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/17399ff4-7b75-4171-9ee7-c9d7a3b8e7a4/Untitled.png)

********************Network Traffic Monitoring :********************

****************************************DNS and Networking :****************************************

- As we all know, IP addresses are used to identify devices on the network.
- ********DNS******** is a service that translates the URL to IP address.
- when you ask a DNS to perform a search for a name-to-IP address translation is called ******DNS lookup******
- The IP address is stored in the DNS server as a record and there are a number of record types.
- The DNS server will use an address record or a record when simply looking for a website name translation. Another type of record is a domain name system service record, or SRP, which can tell the device what services are available for a particular website.
- For example, a website that needs video conferencing capabilities requires the use of a video communication protocol, like Session Initiation Protocol or SIP. DNS uses port number 53 and can send requests reliably using TCP or unreliably using UDP.
- DNS needs to be fast. UDP is the preferred protocol because it doesn't provide packet delivery check overheads. Many DNS servers worldwide provide this lookup service because there are so many incoming requests from everyone surfing the web.
- If there were only one DNS server, you would have to wait a really long time for the translation to take place before you can get to the website you want to access. Anyone can create DNS servers. But there are so many in existence that you don't have to go through the setup yourself to access websites. Internet Service Providers or ISPs, typically provided DNS server for their customers And companies like Microsoft owned many such servers worldwide.
- Here are four types of DNS servers, illustrated in the diagram below, that provide a structure, each type playing a different role in that structure. First, there are the recursive DNS servers, the root domain servers, top-level DNS servers, and the authoritative DNS servers. The model is hierarchical.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5f9c2fd2-30f9-42e1-9216-673e9c0e8948/Untitled.png)

### **Recursive DNS server**

First is the recursive server – or resolver –which is usually the DNS server on your device with its IP address configured either manually or via DHCP. If it receives a DNS request and it's familiar with it, the recursive resolver can respond with the IP address straightaway from its memory. If the recursive resolver is unfamiliar with the IP address, the request must go to the root domain servers.

### **Root domain servers**

There are 13 root domain servers spread across the world; all looked after by a governing body called the Internet Assigned Numbers Authority (IANA). The root domain servers' job is to direct queries to the correct location. Again, the root server could potentially have the answer if it has dealt with the IP recently, but if not, it will pass the query to the top-level domain servers that are responsible for that area.

### **Top-level DNS servers**

Top-level servers (TLD) look after large areas and even countries. Domain name extensions like .com, .co.uk, .net, and .org are all different TLD servers. Again, they can give the correct location if they have recently received this request. If not, they will forward the query to the authoritative name servers.

### **Authoritative DNS servers**

These servers hold the specific information the client has been trying to obtain. Thus it will provide the necessary website name-to-IP-address translation for the recursive DNS server. These servers are where companies register their names – known as domains – like Microsoft.com or samsscoops.com. These servers are spread over hundreds of locations, providing the many DNS servers needed to support the internet.

As you can note from the descriptions of the four different types of servers, requesting a name-to-IP-address translation repeats with each server level until the query has been answered. No further steps are required if the answer lies in the recursive DNS server. But if it doesn't, it has to be passed along through each type of server until the answer is returned.

**************************DNS Attacks :**************************

1. DNS Spoofing
2. DNS Hijacking
3. DNS Tunneling
4. DNS Amplification
5. DNS Flood attack

Monitoring can be split into two main tasks: network monitoring and network traffic monitoring. On the one hand, network monitoring involves keeping track of network devices for availability and faults. In contrast, network traffic monitoring is monitoring what protocols and data are moving around a network and monitoring for performance and security threats.

********************Bandwidth******************** determines the rate at which data moves across a network. This is not usually a problem if only a few people and applications use a network

**Network monitoring** can be separated into three steps; 

Step 1 is choosing the correct data source. 

Step 2 involves analyzing the correct component in a network. And 

Step 3 is about using a monitoring tool to optimize and display data in a readable format .

**Network traffic monitoring** can help you to understand how a network and applications are performing and use that data to make sure that the bandwidth and network are not overwhelmed .

********************************************************Health and Metric Analysis :********************************************************

Health and metric analysis are about spotting trends and patterns in data collected from network traffic monitoring. The identified trends and patterns can then be used to proactively introduce traffic management methods to keep the network health

- Metric analysis involves measuring key performance statistics to understand how something is performing and predict its future performance based on the gathered data.

********************************************************************************Network Health and performance Metrics :********************************************************************************

1. **Bandwidth usage. T**his metric is about checking that you are not going over the amount of available bandwidth. If the bandwidth usage is too high, it can affect the network's performance by slowing things down.
2. **packet loss**. When packets get lost on the network between the source and destination, you know that TCP can re-send those lost packets. But that can actually create more congestion on the network if it occurs too often.
3. **latency.** This is how long a packet takes to move across the network and back again. It's also known as the round trip time or RTT.
4. **network availability**. This is a key metric because it reflects up time on the network. In other words, it tells you when the network is working and when it is not

**traffic management.** A network can be set up to manage its performance by utilizing something called Quality of Service or QoS. QoS is a suite of different traffic management mechanisms that can be used at different times based on network performance. Although traffic monitoring is ongoing, traffic management mechanisms should only be turned on when needed. If everything works as it should, you don't need to create extra work. Two of the mechanisms included in QoS are traffic marking and prioritization. Traffic marking allows you to mark packets with for example, different colors to indicate priority. For example, real-time information like video calls should be prioritized. Less critical traffic, like email can be given a low priority. In conclusion, collecting data is an essential first step, but it needs to be followed by health and metric analysis to make predictions. The more data is collected, the more reliable the predictions will be.

## What is a log file?

Log files are records of events committed to a file in a list format. They can include all sorts of information about events that happened at a particular time. Every device on the network creates log files, thus giving you a history of what's been happening.

Logs typically contain five headed-up areas. They are:

- Timestamp –the time of the event.
- Log level – how severe or important the event is.
- Username– who caused the event.
- Service or application – what caused the event.
- Event description – what has happened.

## Log file types

- Event log –records information about the usage of network traffic and tracks login attempts, application events, and failed password attempts.
- System log (or syslog) – records operating system events, including startup messages, system changes, shutdowns, and errors and warnings.
- Server log – contains a record of activities in a text document related to a specific server over a specific period of time.
- Change log – lists changes made to an application or file.
- Availability log –tracks uptime, availability, and system performance.
- Authorization and access log – lists who is accessing applications or files.
- Resource log –provides information on connectivity issues and any capacity problems.

1. **Network Security**
- **Define client-server and server-to-server communication.**

**************Client Server Model :**************

- **************server************** is a computer program or device that provides services or resources to other devices or programs, known as ************clients************ over a network.
- **********Server********** can be a physical machine or virtual machine that runs on a cloud-based platform.

**********************How servers help businesses and organizations ?**********************

servers are vital component of a modern businesses. They provide centralized location for managing and accessing resources and services, which can help businesses to simplify their operations and improve their efficiency. Below are the some of the ways that servers can improve businesses.

**************Improved collaboration************** 

**************Scalability************** 

**************Security************** 

**************Accessibility************** 

**************Cost savings**************

******************Client -Server Working Models****************** 

There are few client-server models that differ in terms of how client and server software communicates and how the server shares data and resources with clients.

************************Request-Response Model :************************

- The client sends a request to the server, and the server responds with the requested data or resource.
- This request can be as simple as HTTP or as complex as database query. The client can be a web browser, a mobile app, or any other software that can send a request to a server.
- This model is widely used in web applications you use everyday, such as chrome search, office 365 online application etc.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4d00dd2a-fd70-4b28-84eb-045f0eeb23b3/Untitled.png)

**************************************************peer-to-peer model (p2p):**************************************************

- A peer to peer model has no central server. Instead all the devices on the network can act as both a client and a server, sharing data and resources with each other.
- This p2p model is commonly used in file-sharing applications, where users can share files directly without needing a central server. peer-to-peer network can be more scalable and fault-tolerant than client-server networks, as there is no single point of failure.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6d4b7946-2626-4549-b4b9-7249920a21d7/Untitled.png)

************Publish-subscribe Model :************ 

- ******In****** publish-subscribe model the server sends data to clients who have subscribed to receive updates on specific topics or events. The clients do not send requests to the server, instead, they receive data whenever the server publishes updates.
- This model is commonly used in real-time applications such as stock market tickets or social media feeds, where clients must receive real-time updates.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9870e719-7659-465f-a020-a272539bda90/Untitled.png)

************Risks Involved in Client-Server Networking :************

****************************Security Risks****************************

********************Dependency******************** 

********************Complexity******************** 

********************cost******************** 

********************Downtime********************

********************************************************Different Types of Servers :********************************************************

**File Server**

- A server that stores and manages files for clients on a network. It allows users to share files and access files from a central location.
- The ********************advantage******************** of file servers is that they allow for centralized file storage, which makes it easier to manage files and ensure data Consistency.
- The ******************downside****************** is that file servers can be expensive to setup and maintain , and they may require specialized software.

 **Web Server** 

- A web server is a server that delivers web pages to clients over the internet. When a client requests a web page, the web server retrieves from its storage and sends it to the client’s web browser.
- The ********************advantage******************** of web servers is that they allow for easy access to web based services and resources.
- The ****************downside**************** is that they can be vulnerable to security threats, such as hacking and denial of service attacks.

**Mail Server**

- A server that handles email communication between clients on a network. It allows users to send and receive email messages and manage their email accounts.
- The ********************advantage******************** of mail servers is that they provide a centralized email management system. Which makes it easier to manage and monitor email traffic.
- **************************The downside************************** is that mail servers can be vulnerable to security threats such as spam and phishing attacks.

 **Database Server**

- A server that stores and manages databases for clients on a network. It allows users to access and manipulate data in a centralized location.
- the ********************advantage******************** of database servers is that they provide centralized database management system, which makes it easier to manage and maintain a huge amount of data.
- The ******************downside****************** is that they can be expensive to setup and maintain, and they require specialized software and expertise.

 **Application Server**

- a server that hosts applications for clients on a network. It allows users to access and use a applications from a centralized location.
- The **advantage** of application servers is that they provide a centralized application management system, which makes it easier to manage and maintain applications.
- The **downside** is that they can be expensive to setup and maintain, and they require specialized software and expertise. ****

**Print Server, Media Server ,Game Server**

## How Does DHCP Work?

When a device connects to a network, it sends a request for an IP address to the DHCP server. The DHCP server then assigns an available IP address to the device, along with other network configuration settings such as:

- Subnet mask
- Default gateway
- DNS server addresses

DHCP uses a process called leasing to assign IP addresses

**DHCP Ip Assignment steps**

 ****

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/d54cc9bd-f3ab-428e-b626-856f434dbe21/Untitled.png)

****DHCP IP Renewal Process :****

DHCP Lease Time

DHCP Renewal

DHCP Server Response

DHCP Address Release

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/59febfd6-482a-48ee-b259-9ddb82252a26/Untitled.png)

****************Advantages and Disadvantages of DHCP System :****************

- Advantages :
    - It’s automated process simplifies network configuration
    - Reduces administrative overhead and configuration errors especially for large networks.
- Disadvantages :
    - It relies on single DHCP server to manage the assignment of IP addresses and other configuration information.
    - If the DHCP server goes down, devices on the network may not be able to obtain IP addresses or connect to the network.
    - DHCP also introduces security risks if not configured properly

## DHCP Relay

Imagine you're a device that needs an IP address, but you're not directly connected to a DHCP server. Instead, you're connected to a switch that's connected to another switch, and that switch is finally connected to the DHCP server. What do you do?

Well, that's where a DHCP relay agent comes in! It is like having a messenger bird, or that flies between you and the DHCP server to deliver your message. A DHCP Relay Agent is a special program that's installed on the switches. It intercepts and forwards DHCP messages between devices on other subnets and the DHCP server.

- Identify different approaches to authorization and authentication.
    
    **************Authentication :**************
    
    Some of the most commonly used authentication protocols :
    
    1. LDAP(light weight Directory Access Protocol ) :
        1. Centralized management
        2. Azure Active directory is one of the popular application which uses LDAP
    2. RADIUS (Remote Authentication Dial-in User Service)
        1. It is a client-server Protocol
        2. Often used for remote access control protocol
    3. Certificate based Authentication 
        1. uses digital certificates
        2. Verifies Identities
        3. Users, devices and application
    4. kerberos
        1. It is a mutual authentication protocol 
        2. encrypts credentials
        3. Microsoft windows
        
        **************************************************************Authentication VS Authorization**************************************************************
        
        | Authentication | Authorization |
        | --- | --- |
        | Verifies the identity of a user, device, or system | Determines what actions a user can perform |
        | Prevents accessif not verified | Controls access to resources |
        | First line of defense | Second line of defense |
        | Typically, a one-time event | Ongoing process |
        | Relies on user-provided credentials | Relies on predefined policies and rules |

******************************************Authorization Models :******************************************

| RBAC | ABAC | MAC | DAC | RuBAC |
| --- | --- | --- | --- | --- |
| Full form | Role-based Access Control | Attribute-based Access Control | Mandatory Access Control | Discretionary Access Control |
| Based on | Role | Attribute | Security labels | Owner-based |
| Access request based on | User's role | User's attributes | User's clearance level and object's security level | User's ownership and access rights |
| Policy enforcement | Centralized | Centralized or decentralized | Centralized | Decentralized |
| Flexibility | Low | High | Low | High |
| Complexity | Low | High | High | Medium |
| Examples | A company limiting access to HR information based on an employee's job title | A hospital limiting access to patient information based on the doctor's specialty | A government agency controlling access to classified information based on security clearance | A file system allowing owners to set permissions for files and folders |

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b32035b1-ebca-4167-9b3b-d8327328c3a2/Untitled.png)

************************************************************wifi routers security protocol************************************************************

| Authentication Mechanism | WEP | WPA | WPA2 |
| --- | --- | --- | --- |
| Security level | Low | Medium | High |
| Encryption type | 64-bit or 128-bit | TKIP* | AES |
| Key management | Static key | 802.1x or PSK** | 802.1x or PSK |
| Vulnerabilities | Easily hacked | Vulnerable to brute-force attacks | More secure than WPA and WEP |
| Compatibility | Compatible with most devices | Compatible with most devices | Compatible with most devices |
| Recommended for use | No | No | Yes |

- Explain network attacks and mitigation.
- Describe what a firewall is as well as its common protocols.
    - ******************Firewall****************** is a network security device that sits between a trusted and a untrusted network, such as the internet.
    - A firewall can act as a protective barrier preventing these threats from entering the network.
    - Firewalls analyze all incoming and outgoing traffic, based on this analysis, it grants or denies access to the network according to pre-defined security rules.
    - By default, most firewalls deny all incoming traffic and filter outgoing traffic until an organization security team configures what traffic should be allowed in and out.

********Firewall Types********

- **********************Packet Filtering firewalls********************** inspect each data packet as it travels through a network. They decide whether to block a specific packet based on the configured rules.
- **********************Application-layer firewalls********************** can be a physical appliance using its own hardware or software-based installed on another machine, like a plug-in or a filter. These types of firewalls target applications and monitor their behavior. For example, if placed in front of a web server, they can inspect requests for HTTP connections and block abnormal floods of traffic indicating a DOS attack.
- **********************Circuit-level firewalls********************** check whether TCP and UDP connections across a network are valid before data is exchanged. For example, this type of firewall might first check whether the source and destination addresses, the user, the time, and the date meet certain defined rules. Data is exchanged between parties without further investigation when these checks pass, and a session starts.
- **********************Proxy server firewalls********************** control the information that goes in and out of a network. This ability means the server can monitor, filter, and cache data requests to and from a network. Firewall proxy servers provide safe and secure internet access to all devices on a network. As depicted in the image below, there can be no communication between the client machine and the internet without the proxy server.
- ************************************stateful firewalls************************************  inspect connections on a network. As traffic hits the firewall, it monitors all packets that go through it and stores a combination of information about the packets in a state table. The state table tracks sessions by recording port numbers as sessions start from inside the network and are transmitted outside of the network. Gathering this information helps the firewall recognize what legitimate traffic with the correct port numbers should look like upon its return, thus allowing legitimate replies back into the network.
- ************************************Next-generation Firewalls************************************ perform many of the same functions as stateful firewalls but with more functions from other types of firewalls, such as packet filtering and VPN support. This type of firewall also investigates packets more thoroughly compared to stateful firewalls. For example, a next-generation firewall can examine the payload for each packet and inspect it for suspicious characteristics and malware

********************************Firewall Rules :********************************

- A firewall is configured with many different rules, and together they create a firewall policy.
- The image below demonstrates that rules are applied per interface and can have different rules for inbound and outbound traffic

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/dff53269-14e6-4477-80ac-c7236a731561/Untitled.png)

Rules are created using a list of elements that a firewall can check. These include :

**************source address -************** where the data has come from. This is typically an IP address but can also be a fully qualified domain name or fqdn. An FQDN is the name of a device on the internet, verified by an external DNS server. ****************************

**************Destination Address**************  Where the data is going. This is usually an IP address but can also be a fully qualified Domain Name (FQDN)

**************Port and protocol numbers************** The services that application require

**************The interface************** rules can be associated with a particular interface or port on a firewall

**************Direction************** whether the traffic is inbound or outbound

**************Time************** Specify when the data will or won’t be permitted

**************The decision************** whether to permit or deny the packet

when creating firewall protocol, it’s important to remember the following three rules:

********************************************Top-down processing :******************************************** a firewall starts at the top of a policy list, making its way down to the bottom, so the order of the rules is critical ****************************************************************************************

**********************************************Rule matched  -********************************************** if any incoming traffic matches the criteria of a firewall rule, the firewall will apply the specified allow or deny action without proceeding to the next rule. Any of the other rules below the matched rule will not be considered because firewalls implements top-down processing.

**********************************************Implicit deny********************************************** also known as deny all. This is typically an invisible rule applied when a firewall is initially set up, and it blocks all traffic from the start. It enables a firewall to protect the network as soon as it's activated. This rule remains active the whole time, so many firewall policies have permit statements (also known as allow statements) to allow necessary traffic through. Implicit deny is always the last rule on the rules list. And because it's active by default and invisible, it's important to remember it's there.

1. Cloud Computing and Networking
- Evaluate Azure and its available services.
- Explain the concepts of virtualization.
- Discuss common AI types and the resources that support them.
- Describe common "As a Service" models for enterprise.
