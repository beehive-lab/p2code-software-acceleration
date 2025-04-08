#!/bin/bash

# === Configuration ===
JAVA_SRC_FILE="$1"
OUTPUT_DIR="/tmp/tornado-bin"
TORNADO_JARS="$TORNADO_SDK/share/java/tornado/tornado-api-1.1.0.jar:$TORNADO_SDK/share/java/tornado/tornado-drivers-opencl-1.1.0.jar"

if [ -z "$JAVA_SRC_FILE" ]; then
  echo "❌ Usage: ./p2code-run-tornadovm.sh <YourJavaFile.java>"
  exit 1
fi

if [ ! -f "$JAVA_SRC_FILE" ]; then
  echo "❌ File not found: $JAVA_SRC_FILE. Try passing the full path of the Java class."
  exit 1
fi

# === Step 1: Compile ===
echo "🔧 Compiling $JAVA_SRC_FILE..."
$JAVA_HOME/bin/javac \
  --release 21 \
  --enable-preview \
  -cp "$TORNADO_JARS" \
  -g:vars \
  -d "$OUTPUT_DIR" \
  "$JAVA_SRC_FILE"

if [ $? -ne 0 ]; then
  echo "❌ Compilation failed"
  exit 1
fi
echo "✅ Compilation successful"

# === Step 2: Determine Fully Qualified Class Name ===
PACKAGE_LINE=$(grep "^package " "$JAVA_SRC_FILE")
CLASS_NAME=$(basename "$JAVA_SRC_FILE" .java)

if [ -n "$PACKAGE_LINE" ]; then
  PACKAGE_NAME=$(echo "$PACKAGE_LINE" | sed 's/package //' | sed 's/;//')
  FQCN="${PACKAGE_NAME}.${CLASS_NAME}"
else
  FQCN="$CLASS_NAME"
fi

# === Step 3: Run with TornadoVM ===
echo "🚀 Running with TornadoVM: $FQCN"
TCLASSPATH="$OUTPUT_DIR:$TORNADO_JARS"
tornado --threadInfo -cp "$TCLASSPATH" "$FQCN"

