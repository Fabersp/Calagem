
# Calagem App

## Overview

Calagem is an agricultural mobile application designed to calculate the necessary liming adjustments for soil correction. It helps farmers and agronomists optimize soil conditions to enhance crop productivity.

---

## 📱 **Application Interface**

### 1. **Owner Screen**
- **Purpose:** Register farm and owner information.
- **Fields:**
   - **Owner:** Owner's name (e.g., Fazenda 1)
   - **Property:** Property name (e.g., Fazenda 2)
   - **Address:** Road name
   - **City:** Brazilia
   - **Phone:** 99-9999-9999
   - **Mobile:** 99-9999-9999
   - **Email:** fazenda@fazenda.com.br

- **Available Actions:**
   - Save information.
   - Navigate between tabs: Owner, Liming, Info.

---

### 2. **Liming Screen**
- **Purpose:** Display soil analysis results.
- **Key Information:**
   - **Sample Date:** 27/09/2014
   - **Property:** Fazenda 1, Fazenda 2
   - **Result:** Required liming (in t/ha)
   - **Example:**  
     - Fazenda 1: 3.202 (t/ha)
     - Fazenda 2: 2.875 (t/ha)

- **Highlight:** Results indicating liming necessity are displayed in **red**.

---

### 3. **Edit Analysis Screen**
- **Purpose:** Input technical data for soil analysis.
- **Technical Fields:**
   - **Soil:** Sandy
   - **Crop:** Cotton
   - **V2 %:** 50
   - **Sample:** asasas
   - **Date:** 27/09/2014
   - **PRNT:** 89
   - **Chemical Parameters:**  
     - **k:** 0.7  
     - **Ca:** 0.8  
     - **Mg:** 0.7  
     - **H+Al:** 0.8  
     - **SB:** 2.2  
     - **CTC:** 3  
     - **V1%:** 73.33

- **Final Result:** -0.787 (t/ha) → **"No liming is required."**

---

## ⚙️ **Key Functionalities**
1. **User Interface:**  
   - Uses **UIWebView** for dynamic content loading.  
   - Custom pop-ups with `MTPopupWindow`.  

2. **Data Management:**  
   - **Core Data** for data persistence and manipulation.  
   - `NSManagedObjectContext` for object lifecycle management.  

3. **PDF Reports:**  
   - Generates soil analysis reports using `PDFRenderer`.  
   - Includes technical soil data and liming results.  

4. **Notifications & Alerts:**  
   - Local notifications for reminders.  
   - Alerts for errors and warnings.  

5. **Interface Customization:**  
   - Custom `UINavigationBar` and `UITabBar`.  
   - Styling for buttons and fonts.  

6. **Animations:**  
   - Pop-up window animations using `UIViewAnimationOptionTransitionFlipFromRight`.  

---

## 🛠️ **Suggested Improvements**
1. **Update UIWebView:**  
   - Replace `UIWebView` with `WKWebView` for better performance and security.

2. **Error Handling:**  
   - Improve error messages for clarity.

3. **Input Validation:**  
   - Validate mandatory fields before saving data.

4. **Memory Management:**  
   - Ensure proper resource deallocation.

---

## 📚 **Technologies Used**
- Objective-C
- Core Data
- UIKit
- PDF Generation

## 💻 **Setup and Installation**
1. Clone the repository:  
   ```bash
   git clone https://github.com/your-repo/calagem.git
   ```
2. Open the project in **Xcode**.
3. Build and run the application on an iOS Simulator or a physical device.

## 🚀 **How to Use**
1. Fill in the owner and property details.
2. Enter soil and crop data in the analysis section.
3. Generate soil liming reports.
4. Review the results and plan corrections.

## 🤝 **Contributing**
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## 📧 **Contact**
For any inquiries, reach out via email: **fazenda@fazenda.com.br**

---

## 📝 **License**
This project is licensed under the **MIT License**.

---

© 2024 Pro Master Solution. All rights reserved.
