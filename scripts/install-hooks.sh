#!/bin/sh
#
# Git hooks 설치 스크립트
#

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
GIT_HOOKS_DIR="$PROJECT_ROOT/.git/hooks"

echo "🔧 Git hooks 설치 중..."

# pre-commit hook 설치
cp "$SCRIPT_DIR/pre-commit" "$GIT_HOOKS_DIR/pre-commit"
chmod +x "$GIT_HOOKS_DIR/pre-commit"

echo "✅ pre-commit hook 설치 완료!"
echo ""
echo "이제 커밋할 때마다 자동으로 코드 품질 검사가 실행됩니다."
echo ""
echo "수동 검사 명령어:"
echo "  ./gradlew spotlessCheck   # 포맷 검사"
echo "  ./gradlew spotlessApply   # 포맷 자동 수정"
echo "  ./gradlew checkstyleMain  # 스타일 검사"
echo "  ./gradlew check           # 전체 검사"

