import pandas as pd
import sys

def load_data(file):
    try:
        df = pd.read_csv(file)
        print("\nData loaded successfully!\n")
        return df
    except Exception as e:
        print("Error loading file:", e)
        sys.exit()

def show_basic_info(df):
    print("\n--- Basic Info ---")
    print(df.info())

def show_statistics(df):
    print("\n--- Statistical Summary ---")
    print(df.describe())

def check_missing(df):
    print("\n--- Missing Values ---")
    print(df.isnull().sum())

def show_top_rows(df):
    print("\n--- Top 5 Rows ---")
    print(df.head())

def filter_data(df):
    col = input("Enter column name to filter: ")
    val = input("Enter value: ")
    
    if col in df.columns:
        result = df[df[col] == val]
        print("\n--- Filtered Data ---")
        print(result)
    else:
        print("Column not found!")

def main():
    file = input("Enter CSV file name: ")
    df = load_data(file)

    while True:
        print("\nChoose an option:")
        print("1. Show Basic Info")
        print("2. Show Statistics")
        print("3. Check Missing Values")
        print("4. Show Top Rows")
        print("5. Filter Data")
        print("6. Exit")

        choice = input("Enter choice: ")

        if choice == '1':
            show_basic_info(df)
        elif choice == '2':
            show_statistics(df)
        elif choice == '3':
            check_missing(df)
        elif choice == '4':
            show_top_rows(df)
        elif choice == '5':
            filter_data(df)
        elif choice == '6':
            print("Exiting...")
            break
        else:
            print("Invalid choice!")

if __name__ == "__main__":
    main()