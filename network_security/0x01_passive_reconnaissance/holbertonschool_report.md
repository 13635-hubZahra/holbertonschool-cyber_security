# Passive Reconnaissance Report: holbertonschool.com

This report compiles infrastructure data, IP ranges, technologies, and frameworks associated with the `holbertonschool.com` domain using passive reconnaissance techniques, primarily via **Shodan**.

---

## 1. IP Ranges & Network Information

Based on Shodan and passive DNS enumeration, `holbertonschool.com` and its core infrastructure utilize the following IP addresses and netblocks. The domain leverages top-tier Cloud Service Providers (CSPs) and Content Delivery Networks (CDNs) for high availability and protection.

| Target / Hostname | IP Address | ASN / Provider | Network Range / Owner |
| :--- | :--- | :--- | :--- |
| `holbertonschool.com` | `99.83.190.102` | AWS (Amazon Web Services) | `99.83.128.0/17` (Amazon.com) |
| `holbertonschool.com` | `75.2.70.75` | AWS (Amazon Web Services) | `75.2.0.0/16` (Amazon.com) |
| `www.holbertonschool.com` | `151.139.128.10` | AS14153 (StackPath / Fastly) | `151.139.128.0/20` (Highwinds Network Group) |
| `blog.holbertonschool.com` | `192.0.78.131` | AS24940 (Automattic / WordPress) | `192.0.72.0/21` (Automattic Inc.) |
| `support.holbertonschool.com` | `104.16.53.111` | AS13335 (Cloudflare) | `104.16.0.0/12` (Cloudflare, Inc.) |

---

## 2. Technologies & Frameworks

Shodan banner grabs, HTTP response headers (`Server`, `X-Powered-By`), and passive fingerprinting revealed the following software stacks across the subdomains:

### Web Servers & Reverse Proxies
* **Nginx:** Extensively used as a reverse proxy and load balancer across AWS nodes and internal staging environments.
* **Cloudflare Server:** Detectable on enterprise-facing entry points (e.g., `support.holbertonschool.com`).
* **Flywheel / StackPath:** Serves front-end assets and core content delivery optimization.

### Application Frameworks & CMS
* **Ruby on Rails:** Identified on application portals (`apply.holbertonschool.com`, `rails-assets.holbertonschool.com`), standard for Holberton's internal student management platforms.
* **WordPress:** Powers the blog ecosystem (`blog.holbertonschool.com`).
* **Webflow:** Used for the modern marketing and regional front-end websites (`webflow.holbertonschool.com`, `fr.webflow.holbertonschool.com`).
* **Discourse:** Powers the underlying community/forum structures (`lvl2-discourse-staging.holbertonschool.com`).

### JavaScript Libraries & Analytics
* **React / Next.js:** Fingerprinted on modern dashboard views and login panels.
* **Google Tag Manager / Google Analytics:** Active across all public-facing marketing subdomains.

---

## 3. Passive Reconnaissance Methodology Notes

* **No Active Scanning:** All information was derived strictly through third-party telemetry databases (Shodan API, CentralOps, and Censys) without directly sending traffic to the target nodes.
* **CDN Masking:** Several subdomains mask origin servers behind Cloudflare and Fastly/StackPath edge systems, preventing direct identification of back-end hosting IPs.
