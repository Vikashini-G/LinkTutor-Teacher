//
//  TeacherCompleteHomePageSwiftUIView.swift
//  LinkTutor(T)
//
//  Created by Vikashini G on 17/03/24.
//

import SwiftUI

struct TeacherCompleteHomePageSwiftUIView: View {
    var body: some View {
        NavigationStack{
            TabView{
                TeacherHomePage()
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                teachersTimetablePageSwiftUIView(allClasses: [
                    TeacherTimetableClass(
                        id: UUID(),
                        className: "Math",
                        tutorName: "John Doe",
                        classStartTime: Date(),
                        classEndTime: Date().addingTimeInterval(3600)
                    ),
                    TeacherTimetableClass(
                        id: UUID(),
                        className: "History",
                        tutorName: "Jane Smith",
                        classStartTime: Date().addingTimeInterval(86400),
                        classEndTime: Date().addingTimeInterval(90000)
                    ),
                    TeacherTimetableClass(
                        id: UUID(),
                        className: "English",
                        tutorName: "Carol",
                        classStartTime: Date().addingTimeInterval(2 * 24 * 60 * 60),
                        classEndTime: Date().addingTimeInterval(2 * 24 * 60 * 60 + 3600)
                    ),
                ])
                .tabItem{
                    Label("My Timetable", systemImage: "calendar")
                }
            }
        }
    }
}

#Preview {
    TeacherCompleteHomePageSwiftUIView()
}
