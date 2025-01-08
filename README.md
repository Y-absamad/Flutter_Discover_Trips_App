# Discover Trips App

Discover Trips App is a simple Flutter application that helps users explore different trips based on categories such as lakes, islands, and deserts.  

## Purpose  

- The purpose of this project is to apply what I’ve learned about Flutter to improve my skills. 
- It’s a practice project to enhance my understanding of building user interfaces and managing app state.

## Features  

- The app includes **4 main pages**:  

1. **Categories Page**: Displays different trip categories such as lakes, islands, deserts, and more. Each category contains 5 trips.

2. **All Trips Page**: Shows all the trips available in the app.

3. **Favorites Page**: Displays trips added to the user's favorite list.  

4. **Trip Details Page**: Displays detailed information about a selected trip.

## Navigation

- You can navigate between the three pages using the **Bottom Navigation Bar**.
- The Categories page is the default page when the app is launched.

## Drawer

- There is a **Drawer** at the top of the pages.
- You can use it to filter trips by type (summer, winter, family-friendly).

## Adding Trips to Favorites

You can add any trip to your favorites list by tapping the heart icon in the trip details.

## State Management

- State management is handled using **setState**.

- Data stored in volatile memory (RAM) includes:  
  - Applied filters.  
  - The list of favorite trips.  

## Localization and RTL Support  

The app is fully localized for Arabic users, with all text and layouts starting from the right side (RTL).

## Data Storage  

- All **trip data** (e.g., name, image, description, type) is stored in a dedicated repository file within the app.  
- All **category data** (e.g., category ID, name) is also stored in a separate repository file within the app.  

## Project Structure

The project's folder structure is as follows:

```plaintext
lib/
├── models/
│   ├── category.dart
│   └── trip.dart
│
├── repository/
│   ├── category_repository.dart
│   └── trip_repository.dart
│
├── viewmodels/
│   ├── category_manager.dart
│   ├── favorite_manager.dart
│   └── trips_manager.dart
│
├── screens/
│   ├── views/
│   │   ├── all_trips.dart
│   │   ├── categories_screen.dart
│   │   ├── favorites_trips_list.dart
│   │   ├── trips_by_category_screen.dart
│   ├── home_screen.dart
│   └── trip_details_screen.dart
│
├── utils/
│   ├── app_router.dart
│   └── app_theme_data.dart
│
├── widgets/
│   ├── drawer/
│   │   ├── app_drawer.dart
│   │   └── build_list_title_switch.dart
│   │
│   ├── home/
│   │   └── bottom_navigation_bar.dart
│   │
│   ├── tripDetails/
│   │   ├── display_image.dart
│   │   ├── list_view_container.dart
│   │   ├── section_titel.dart
│   │   ├── trip_status_card.dart
│   │
│   ├── category_item.dart
│   ├── display_cached_network_image.dart
│   ├── display_trip_list.dart
│   ├── trip_info_card.dart
│   ├── trip_item.dart
│
├── main.dart
