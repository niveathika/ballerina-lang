// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/test;
import ballerina/io;

// Tests skipping of dependsOn functions when after func fails.

public function afterFunc() {
    // This will throw an exception and fail the after function
    int i = 12/0;
    io:println("After");
}

// This test should pass
@test:Config {
    after: "afterFunc"
}
public function test1() {
    io:println("test1");
}

// This should be skipped
@test:Config {
    dependsOn:["test1"]
}
public function test2() {
    io:println("test2");
}

// This test should pass
@test:Config {}
public function test3() {
    io:println("test3");
}

