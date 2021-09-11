
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last = ##t
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Vuelvo al Sur"
composer = #"Astor Piazzolla"
meter = #"(Tango)"
kwtempo = #"Medium"
kwstyle = #"Tango"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  % asplayed = #"" % doit être commentée si vide
  url = #""
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }
    tagline = ##f
}


\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
cis1*2:m9 c:m9 es:m9 d:m9 cis1:m9 bes:m9
g1:m9 g:m/bes c1:m7 f:9- bes2:7+ bes:6.9
es4:7 \parenthesize es2.:7+ a1:m5-7 d2:7sus4 d:7
g1:m9 g:m/bes c1:m7 f:9- bes2:7+ bes:6.9
es1:7+ a:m5-7 d2:7sus4 d:7
g1*4:m g:m g1:m g:m7+
}


theNotes =  \relative c'' {
  \clef "treble" \key f \major \time 4/4 \oneVoice
    \showStartRepeatBar \bar "[|:"
  \Intro a4. gis8 ~ gis2 ~ | % 2
  gis4. cis,8 dis8 e8 gis8 cis8 | % 3
  d4. es16 d16 c2 ~ | % 4
  c2 r2 |
  ces4. des16 ces16 bes2 ~ | \break
  bes4. des,8 f8 ges8 bes8 es8 | % 7
  e?4. d8 ~ d2 ~ | % 8
  d2 r2 | 
  a4 gis2 g4 | 
  ges4 f2 e4 \bar "||" \break
  \key bes \major | % 11
  \A es4. d8 d2 ~ | % 12
  d4 r8 d8 es8 g8 bes8 d8 | % 13
  d4. c16 bes16 c2 ~ | % 14
  c2. r8 c8 ~ | % 15
  c4. bes8 bes2 ~ | % 16
  bes4 r8 c,8 des8 f8 c'8 bes8 | % 17
  bes4. a16 g16 a2 ~ | % 18
  a2. r4 | \break
  \B es4. d8 d2 ~ | 
  d4 r8 d'8 ~ d8 c8 bes16 a16 g8 | % 21
  d'4 ~ d8 c16 bes16 c2 ~ | % 22
  c2. r8 c8 ~ | % 23
  c4. bes8 ~ bes2 ~ | % 24
  bes4 r8 bes8 ~ bes8 a8 g16 fis16 g8 | % 25
  bes4 ~ bes8 a16 g16 a2 ~ | % 26
  a2. r8 d,8 | \bar "||" \break
  \C
  a'4. g8 ~ g2 ~ | % 28
  g4 ~ g2 r8 d8 | % 29
  a'4. g8 ~ g2 ~ | \barNumberCheck #30
  g4. d8 es8 g8 bes8 d8 | 
  a4. g8 ~ g2 ~ | % 32
  g4 ~ g2 r8 d8 |  % 33
  a'4. g8 ~ g2 ~ | \toCoda % 34
  g4 ~ g2 r4 \bar "|."
  \break \Coda
  g4. \repeatTie d8 es8 g8 bes8 d8 | fis1 \bar ".."
}

grille = \chordmode {
\repeat percent 2 cis1:m9 \repeat percent 2 c:m9 \break
\repeat percent 2 es:m9 \repeat percent 2 d:m9 \break 
cis:m9 bes:m9 \stopStaff s \bar "" s \startStaff \break
g:m9 g:m/bes c:m7 f:9- \break
\/bes2:7+ bes:6.9 \startStaff es1:7 a:m5-7 \/ d2:7sus d:7 \startStaff \break
g1:m9 g:m/bes c:m7 f:9- \break
\/bes2:7+ bes:6.9 \startStaff es1:7+ a:m5-7 \/ d2:7sus d:7 \startStaff \break
\repeat percent 4 g1:m \break \repeat percent 4 g1:m
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 Intro s1*11 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B s1*7
  s1 ^\markup \bold \box \fontsize #7 C
}


Basse = \relative c {
 \transposition c \clef "bass" \key c \major
 \time 4/4 | % 1
 \Intro
 cis8 gis'8 dis'8 e8
 dis8 gis,8 dis'8 e8 | % 2
 cis,8 gis'8 dis'8 e8
 dis8 cis8 gis8 e8 | % 3
 c8 g'8 d'8 es8 d8 \break
 g,8 d'8 es8 | % 4
 c,8 g'8 d'8 es8 c,8
 g'8 d'8 es8 | % 5
 es,8 bes'8 f'8 ges8
 f8 bes,8 f'8 ges8 | % 6
 es,8 bes'8 f'8 ges8
 f8 des8 bes8 ges8 | % 7
 d8 a'8 e'8 f8 d,8
 a'8 e'8 f8 | % 8
 d,8 a'8 e'8 f8 d,8
 a'8 e'8 f8 | % 9
 cis,8 gis'8 dis'8 e8
 dis8 gis,8 dis'8 e8 |
 bes,8 f'8 c'8 des8 
 bes,4 f'4 \bar "||" \break
 \A \key bes \major | % 11
 g4. g4. g8 a8 | % 12
 bes4. bes4. g8 bes8 | % 13
 c4. c4. c4 | % 14
 f4. f4. f,4 | \break
 bes4. bes4. f4 | % 16
 es4. es4. es8 g8 | % 17
 a4. a4. a4 | % 18
 d,4. d4. d8 fis8 | \bar "||" \break \B
 g4. g4. g4 |
 bes4. bes4. bes4 | % 21
 c4. c4. c4 | % 22
 f,4. f4. f4 | \break
 bes4. bes4. bes4 | % 24
 es,4. es4. es4 | % 25
 a4. a4. a4 | % 26
 d,4. d4. d4 | \bar "||" \break \C
 g2. r8 a16 bes16 | % 28
 d2 bes4 d4 | % 29
 g,2. r8 a16 bes16 | 
 d2 bes4 d4 | \break
 g,2. r8 a16 bes16 | % 32
 d2 bes4 d4 | % 33
 g,2. a8 bes8 | \toCoda
 d4. g,8 bes4 d,4 | \break \bar "|."
 \Coda
 d'4. g,8 bes4 d,4 | g,1 \bar ".."
}

Guitare = \relative c' {
 \clef "treble_8" \key c \major \time 4/4 | % 1
 \Intro e4 -> r4 es4 -> r4 | % 2
 e4 -> r4 es4 -> r4 | % 3
 es4 -> r4 d4 -> r4 | % 4
 es4 -> r4 d4 -> r4 | % 5
 ges4 -> r4 f4 -> r4 | % 6
 ges4 -> r4 f4 -> r4 | % 7
 f4 -> r4 e4 -> r4 | % 8
 f4 -> r4 e4 -> r4 | % 9
 e4 -> r4 es4 -> r4 | 
 des4 -> r4 c4 -> r4 \bar "||" \break \A
 \key bes \major | % 11
 r8 <d f bes>4 r8 <d f bes>2 | % 12
 r8 <d g bes>4 r8 <d g bes>2 | % 13
 r8 <es g bes>4 r8 <es g bes>2 | % 14
 r8 <es ges c>4 r8 <es ges c>2 | 
 r8 <d f a>4 r8 <c d g>2 | % 16
 r8 <bes des g>4 r8 <bes des g>2 | % 17
 r8 <c es g>4 r8 <c es g>2 | % 18
 r8 <c g' a>4 r8 <c fis a>2 | \bar "||" \break \B
 <bes d f>8-> <bes d f>8 <bes d f>8 <bes d f>8-> <bes d f>8 <bes d f>8 <bes d f>8-> <bes d f>8 |
 <bes d g>-> <bes d g> <bes d g> <bes d g>-> <bes d g> <bes d g> <bes d g>-> <bes d g>8 | % 21
 <bes es g>-> <bes es g> <bes es g> <bes es g>-> <bes es g> <bes es g> <bes es g>-> <bes es g> | % 22
 <a es' ges>-> <a es' ges> <a es' ges> <a es' ges>-> <a es' ges> <a es' ges> <a es' ges>-> <a es'ges> | \break
 <a d f>-> <a d f> <a c f> <g c f>-> <g c f> <g c f> <g c f>-> <g c f> | % 24
 <bes d g>-> <bes d g> <bes d g> <bes d g>-> <bes d g> <bes d g> <bes des g>-> <bes d g> | % 25
 <g c es>-> <g c es> <g c es> <g c es>-> <g c es> <g c es> <g c es>-> <g c es> | % 26
 <g c es>-> <g c es> <g c es> <g c es>-> <fis c' es> <fis c' es> <fis c' es>-> <fis c' es> | % 27
 \bar "||" \break \C
 <bes d a'>4. <bes d g>4. <bes d fis>4 | % 28
 <g bes f'>4. <g bes e>4. <g bes es>4 | % 29
 <bes d a'>4. <bes d g>4. <bes d fis>4
 <g bes f'>4. <g bes e>4. <g bes es>4 |
 <bes d a'>4. <bes d g>4. <bes d fis>4 | % 32
 <g bes f'>4. <g bes e>4. <g bes es>4 | % 33
 <bes d a'>4. <bes d g>4. <bes d fis>4 |\toCoda
 <g bes f'>4. <g bes f'>8 ~ <g bes f'>2 | \break \bar "|." \Coda
 <g bes f'>4. <g bes f'>8 ~ <g bes f'>2 
 <bes d f>1 \bar ".." }


Tablatures = \relative c' {
 \clef "tab" \stopStaff \override Staff.StaffSymbol.line-count = #6
 \startStaff \key c \major \time 4/4 | % 1
 e4 -> \1 r4 es4 -> \2 r4 | % 2
 e4 -> \1 r4 es4 -> \2 r4 | % 3
 es4 -> \2 r4 d4 -> \2 r4 | % 4
 es4 -> \2 r4 d4 -> \2 r4 | % 5
 ges4 -> \1 r4 f4 -> \1 r4 | % 6
 ges4 -> \1 r4 f4 -> \1 r4 | % 7
 f4 -> \1 r4 e4 -> \1 r4 | % 8
 f4 -> \1 r4 e4 -> \1 r4 | % 9
 e4 -> \1 r4 es4 -> \2 r4 | 
 des4 -> \2 r4 c4 -> \2 r4 \bar "||"
 \key bes \major | % 11
 r8 <d f bes>4 \3 \2 \1 r8 <d f bes>2 \3 \2 \1 | % 12
 r8 <d g bes>4 \3 \2 \1 r8 <d g bes>2 \3 \2 \1 | % 13
 r8 <es g bes>4 \3 \2 \1 r8 <es g bes>2 \3 \2 \1  | % 14
 r8 <es ges c>4 \3 \2 \1 r8 <es ges c>2 \3 \2 \1  | % 15
 r8 <d f a>4 \3 \2 \1 r8 <c d g>2 \3 \2 \1 | % 16
 r8 <bes des g>4 \3 \2 \1 r8 <bes des g>2 \3 \2  \1 | % 17
 r8 <c es g>4 \3 \2 \1 r8 <c es g>2 \3 \2 \1 | % 18
 r8 <c g' a>4 \3 \2 \1 r8 <c fis a>2 \3 \2 \1 | % 19
 <bes d f>8 \3 \2 \1 <bes d f>8 \3 \2 \1
 <bes d f>8 \3 \2 \1 <bes d f>8 \3 \2 \1
 <bes d f>8 \3 \2 \1 <bes d f>8 \3 \2 \1
 <bes d f>8 \3 \2 \1 <bes d f>8 \3 \2 \1 |
 <bes d g>8 \3 \2 \1 <bes d g>8 \3 \2 \1
 <bes d g>8 \3 \2 \1 <bes d g>8 \3 \2 \1
 <bes d g>8 \3 \2 \1 <bes d g>8 \3 \2 \1
 <bes d g>8 \3 \2 \1 <bes d g>8 \3 \2 \1 | % 21
 <bes es g>8 \3 \2 \1 <bes es g>8 \3 \2 \1
 <bes es g>8 \3 \2 \1 <bes es g>8 \3 \2 \1
 <bes es g>8 \3 \2 \1 <bes es g>8 \3 \2 \1
 <bes es g>8 \3 \2 \1 <bes es g>8 \3 \2 \1 | % 22
 <a es' ges>8 \3 \2 \1 <a es' ges>8 \3 \2 \1
 <a es' ges>8 \3 \2 \1 <a es' ges>8 \3 \2 \1
 <a es' ges>8 \3 \2 \1 <a es' ges>8 \3 \2 \1
 <a es' ges>8 \3 \2 \1 <a es' ges>8 \3 \2 \1 | % 23
 <a d f>8 \3 \2 \1 <a d f>8 \3 \2 \1 <a
 c f>8 \3 \2 \1 <g c f>8 \3 \2 \1 <g c f>8 \3
 \2 \1 <g c f>8 \3 \2 \1 <g c f>8 \3 \2 \1  <g c f>8 \3 \2 \1 | % 24
 <bes des g>8 \3 \2 \1 <bes des g>8 \3 \2 \1
 <bes des g>8 \3 \2 \1 <bes des g>8 \3 \2 \1
 <bes des g>8 \3 \2 \1 <bes des g>8 \3 \2 \1
 <bes des g>8 \3 \2 \1 <bes des g>8 \3 \2 \1 | % 25
 <g c es>8 \4 \3 \2 <g c es>8 \4 \3 \2 
 <g c es>8 \4 \3 \2 <g c es>8 \4 \3 \2 <g c es>8
 \4 \3 \2 <g c es>8 \4 \3 \2 <g c es>8 \4 \3 \2
 <g c es>8 \4 \3 \2 | % 26
 <g c es>8 \4 \3 \2 <g c es>8 \4 \3 \2 
 <g c es>8 \4 \3 \2 <fis c' es>8 \4 \3 \2 <fis c'
 es>8 \4 \3 \2 <fis c' es>8 \4 \3 \2 <fis c'es>8 \4 \3 \2 <fis c' es>8 \4 \3 \2 | % 27
 <bes d a'>4. \3 \2 \1 <bes d g>4. \3 \2 \1 <bes d fis>4 \3 \2 \1 | % 28
 <g bes f'>4. \4 \3 \2 <g bes e>4. \4 \3 \2 <g bes es>4 \4 \3 \2 | % 29
 <bes d a'>4. \3 \2 \1 <bes d g>4. \3 \2 \1 <bes d fis>4 \3 \2 \1 |
 <g bes f'>4. \4 \3 \2 <g bes e>4. \4 \3 \2 <g bes es>4 \4 \3 \2 | % 31
 <bes d a'>4. \3 \2 \1 <bes d g>4. \3 \2 \1 <bes d fis>4 \3 \2 \1 | % 32
 <g bes f'>4. \4 \3 \2 <g bes e>4. \4 \3 \2 <g bes es>4 \4 \3 \2 | % 33
 <bes d a'>4. \3 \2 \1 <bes d g>4. \3 \2 \1 <bes d fis>4 \3 \2 \1 | 
 <g bes f'>4. \4 \3 \2 <g bes f'>8 ~ \4 ~ \3 ~ \2 <g bes f'>2 \4 \3 \1 | % 35
 <g bes f'>4. \4 \3 \2 <g bes f'>8 ~ \4 ~ \3 ~ \2 <g bes f'>2 \4 \3 \1 |
 <bes d f>1 \3 \2 \1 \bar "|."
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \theNotes \\ { s1*14 \break s1*8 \break s1*8 \break }
      >> >>
  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \transpose c d \theNotes \\ { s1*14 \break s1*8 \break s1*8 \break }
      >> >>

  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
           \transpose c a \theNotes \\ { s1*14 \break s1*8 \break s1*8 \break }
      >> >>
  } }
    \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
        }
        \transpose c a \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleFa \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \Basse
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Guitara4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = "Guit." } <<
             \Guitare
      >>
 \new TabStaff \with {
  stringTunings = #`( ,(ly:make-pitch 0 2 0)
       ,(ly:make-pitch -1 6 0) ,(ly:make-pitch -1 4 0)
       ,(ly:make-pitch -1 1 0) ,(ly:make-pitch -2 5 0)
       ,(ly:make-pitch -2 2 0) )
 }    <<         \Tablatures
      >> >>
} } }