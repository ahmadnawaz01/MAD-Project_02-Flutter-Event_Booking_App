# EventPass – Cross-Platform Event Booking & Management App

**EventPass** is a high-performance, cross-platform mobile application built with Flutter and Dart. It features a complete end-to-end event discovery ecosystem, secure role-based access control (Admin vs. Standard User), and a simulated ticket checkout system powered by Stripe. 

---

## 🚀 Core Features

### 👤 User Capabilities
* **Frictionless Authentication:** Supports secure email/password registration along with single-sign-on (SSO) via Google Sign-In.
* **Event Discovery:** Browse a dynamically updating feed of available events with real-time detail layouts.
* **Ticket Booking Flow:** Select ticket quantities and proceed through a streamlined checkout pipeline.

### 🛠️ Admin Panel (Role-Based)
* **Event Content Management:** Secure interface for administrators to create, detail, and upload new events.
* **Booking Ledger:** View and cross-examine active ticket sales and user booking configurations.

### 💳 Secure Payments
* **Stripe Gateway Integration:** Integrated Stripe SDK within a test-mode sandbox environment to safely simulate secure payment processing and digital receipt handling.

---

## 🛠️ Tech Stack & Architecture

* **Frontend Framework:** `Flutter` (Dart) – Delivering a pixel-perfect, native UI across mobile platforms.
* **Backend & Database:** `Cloud Firestore` – Powering real-time database queries for events and ticket availability logs.
* **Authentication Engine:** `Firebase Authentication` – Handling secure session management and role tokens.
* **Payment Processing:** `Stripe API (Test Mode)` – Simulating real-world monetary transaction pipelines.

