import SwiftUI
import FirebaseAuth

import FirebaseStorage
import FirebaseFirestore

struct CustomSectionHeader: View {
    var title: String

    var body: some View {
        Text(title)
            .font(AppFont.smallSemiBold)
            .textCase(.none)// Customize background color as needed
    }
}

////struct LocationPopupView: View {
////    @Binding var isPresented: Bool
////    @Binding var locationSearchText: String
////    @Binding var selectedLocation: CLLocationCoordinate2D?
////
////    var body: some View {
////        VStack {
////            Text("Choose Location")
////                .font(.title)
////                .padding()
////
////            MapViewExample(searchString: $locationSearchText, selectedLocation: $selectedLocation)
////                .ignoresSafeArea()
////
////            Button("Done") {
////                isPresented = false
////            }
////            .padding()
////        }
////        .padding()
////        .background(Color.white)
////        .cornerRadius(10)
////    }
////}
//
//struct addCoursePage: View {
//    @EnvironmentObject var viewModel : AuthViewModel
//    @State private var currentUserUID: String?
//    @State var teacherUid : String = ""
//    @State var skillType : String = ""
//    @State var academyName : String = ""
//    @State  var className = ""
//    @State  var selectedDates: [Date] = []
//    @State  var startTime = Date()
//    @State  var endTime = Date()
//   // @State  var locationSearchText = ""
//   
//    @State  var classFee = ""
//    @State  var feeType = ""
//    @State  var selectedMode: ClassMode = .online
//  //  @State  var chooseDays: Day = .Monday
//    @State  var selectedDays: [Day] = []
//   // @State  var isLocationPopupPresented = false
//    
//    
//   
//
//    enum ClassMode: String, CaseIterable {
//        case online = "Online"
//        case offline = "Offline"
//    }
//
//    enum Day: String, CaseIterable {
//        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
//    }
//
//    var body: some View {
//        Form {
//            // Class Details Section
//            Section(header: CustomSectionHeader(title: "Class Details")) {
//                TextField("Skill Type", text: $skillType)
//                    
//                
//                
//                
//                TextField("Academy Name", text: $academyName)
//                TextField("Class Name", text: $className)
//
//                VStack(alignment: .leading){
//                    Text("Choose Days")
//                    HStack {
//                        ForEach(Day.allCases, id: \.self) { day in
//                            Text(String(day.rawValue.first!))
//                                .bold()
//                                .foregroundColor(.white)
//                                .frame(width: 30, height: 30)
//                                .background(selectedDays.contains(day) ? Color.cyan.cornerRadius(10) : Color.gray.cornerRadius(10))
//                                .onTapGesture {
//                                    if selectedDays.contains(day) {
//                                        selectedDays.removeAll(where: {$0 == day})
//                                    } else {
//                                        selectedDays.append(day)
//                                    }
//                                }
//                        }
//                    }
//                }
//
//                DatePicker("Start Time", selection: $startTime, displayedComponents: [ .hourAndMinute])
//                    .datePickerStyle(.compact)
//                
//                DatePicker("End Time", selection: $endTime, displayedComponents: [.hourAndMinute])
//                    .datePickerStyle(.compact)
//
////                HStack{
////                    TextField("Location", text: $locationSearchText)
////                    Button("Choose location") {
////                        isLocationPopupPresented.toggle()
////                    }
////                    .foregroundColor(.red)
////                    .sheet(isPresented: $isLocationPopupPresented) {
////                        LocationPopupView(isPresented: $isLocationPopupPresented, locationSearchText: $locationSearchText, selectedLocation: $selectedLocation)
////                    }
////                }
//
//            }
//            .listRowBackground(Color.elavated)
//
//            // Class Fee Section
////            Section(header: CustomSectionHeader(title: "Class Fee")) {
////                TextField("Fee", text: $classFee)
////                Picker("Fee Type", selection: $feeType) {
////                    ForEach(FeeType.allCases, id: \.self) { type in
////                        Text(type.rawValue)
////                    }
////                }
////                .pickerStyle(SegmentedPickerStyle())
////            }
////            .listRowBackground(Color.elavated)
//            
//            // Modes Section
//            Section(header: CustomSectionHeader(title: "Modes")) {
//                Picker("Select Mode", selection: $selectedMode) {
//                    ForEach(ClassMode.allCases, id: \.self) { mode in
//                        Text(mode.rawValue)
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//            }
//            .listRowBackground(Color.elavated)
//            
//            // Buttons Section
//            
//            HStack {
//                Button("Cancel") {
//                    // Handle cancel action
//                }
//                .foregroundColor(.red)
//
//                Spacer()
//
//                Button("Add Class") {
//                    // Handle add class action
//                    guard let currentUserUID = currentUserUID else {
//                           print("Current user UID is nil")
//                           return
//                       }
//                       
//                       // Convert selectedMode to String
//                       let modeString = selectedMode.rawValue
//
//                       // Call addCourseData on the existing AuthViewModel instance
//                       viewModel.addCourseData(skillType: skillType,
//                                                academyName: academyName,
//                                                className: className,
//                                                mode: modeString, // Pass the String value
//                                                fees: classFee, // Use classFee instead of feeType
//                                                week: selectedDates.map { $0.description }, // Convert Date to String
//                                                startTime: startTime.description, // Convert Date to String
//                                                endTime: endTime.description, // Convert Date to String
//                                                teacherUid: "4",
//                                               currentUserUID: "4")
//                   
//                }
//            }
//        }
//        .navigationTitle(Text("Add Class").font(.custom("SF Rounded", size: 22)))
//        .background(Color.background)
//        .scrollContentBackground(.hidden)
//    }
//    
//    
//  
//
//    
//}
//
//struct addCoursePage_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            addCoursePage()
//        }
//    }
//}


struct addCoursePage: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var currentUserUID: User?
  //  @State private var teacherUid: String = ""
    @State private var skillType: String = ""
    @State private var academyName: String = ""
    @State private var className = ""
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var classFee : String = ""
    @State private var selectedMode: ClassMode = .online
    @State private var selectedDays: [Day] = []

    enum ClassMode: String, CaseIterable {
        case online = "Online"
        case offline = "Offline"
    }

    enum Day: String, CaseIterable {
        case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }

    var body: some View {
        Form {
            Section(header: CustomSectionHeader(title: "Class Details")) {
                TextField("Skill Type", text: $skillType)
                TextField("Academy Name", text: $academyName)
                TextField("Class Name", text: $className)
                
                // Choose Days VStack...
                
                DatePicker("Start Time", selection: $startTime, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.compact)
                
                DatePicker("End Time", selection: $endTime, displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.compact)
            }
            .listRowBackground(Color.elavated)

            Section(header: CustomSectionHeader(title: "Modes")) {
                Picker("Select Mode", selection: $selectedMode) {
                    ForEach(ClassMode.allCases, id: \.self) { mode in
                        Text(mode.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .listRowBackground(Color.elavated)

            HStack {
                Button("Cancel") {
                    // Handle cancel action
                }
                .foregroundColor(.red)

                Spacer()

                Button("Add Class") {
                    guard let currentUserUID = currentUserUID else {
                        print("Current user UID is nil")
                        return
                    }
                    
                    viewModel.addCourseData(
                        skillType: skillType,
                        academyName: academyName,
                        className: className,
                        mode: selectedMode.rawValue,
                        fees: classFee,
                        week: selectedDays.map { $0.rawValue },
                        startTime: startTime.description,
                        endTime: endTime.description,
                        teacherUid: currentUserUID.id
                      
                    )
                }
            }
        }
        .onAppear(){
            
        }
        .navigationTitle(Text("Add Class").font(.custom("SF Rounded", size: 22)))
        .background(Color.background)
        .scrollContentBackground(.hidden)
    }
}

struct addCoursePage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            addCoursePage()
        }
    }
}
