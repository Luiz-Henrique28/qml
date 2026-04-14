cmake_minimum_required(VERSION 3.16)
project(AgenciaMed VERSION 1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup(REQUIRES 6.4)

qt_add_executable(AgenciaMed WIN32
    main.cpp
)

qt_add_qml_module(AgenciaMed
    URI AgenciaMed
    VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES
        qml/main.qml
        qml/WelcomeScreen.qml
        qml/MedCrossLogo.qml
        qml/LoginScreen.qml
        qml/RegisterScreen.qml
        qml/HomeScreen.qml
        qml/PerfilScreen.qml
        qml/ExamesScreen.qml
        qml/ConsultasScreen.qml
        qml/SettingsScreen.qml
        qml/LabeledField.qml
        qml/Database.qml
)

target_link_libraries(AgenciaMed PRIVATE
    Qt6::Quick
    Qt6::Sql
)

set_target_properties(AgenciaMed PROPERTIES OUTPUT_NAME AgenciaMedApp)
