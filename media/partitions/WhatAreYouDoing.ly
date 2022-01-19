\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"What Are You Doing The Rest Of Your Life ?"
composer = #"Michel Legrand"
meter = #" (Mod. Ballad)"
kwtempo = #"Mod. Slow"
kwstyle = #"Ballad"

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


theNotes = \relative c' {
  \key c \major
  \partial 2. c8 d8 e8 f8 gis8 a8 
  \A
  \showStartRepeatBar \bar "[|:"
  \repeat volta 3 {
    b4 b8 a8 b2 ~ | % 3
    b4 b8 a8 b8 c8 b8 a8 | % 4
    g4 g8 f8 g2 ~ | % 5
    g4 g8 f8 g8 a8 g8 f8  \break | % 6
    e4 e8 d8 e2 ~ | % 7
    e4 e8 d8 e8 f8 e8 d8 
  }
  \alternative {
    {
      | % 8
      b1 | % 9
      r4 c8 d8 e8 f8 gis8 a8
      \bar ":|]"
    }
    {
      cis,1 | r4 e4 a4 e'4 | \break % 12
      \set Score.repeatCommands = #'((volta #f))  \B
      e8 dis8 e8 cis8 d8 cis8 d8 c8 | % 13
      cis2. e,4 | % 14
      e'8 dis8 e8 cis8 d8 cis8 d8 c8 | % 15
      cis2 r8 cis8 cis8 cis8 \bar "||"  \break | % 16
      des8 c8 des8 bes8 ces8 bes8 ces8 a8 | % 17
      bes4. des,8 c8 des8 ges8 bes8 | % 18
      c8 b8 c8 a8 bes8 a8 bes8 gis8 | % 19
      a8 r8 c,8 d8 e8 f8 gis8 a8 \break \bar ":|]" }
    { b1 ~ | \set Score.repeatCommands = #'((volta #f)) % 21
      b2 c2 \bar "||" |  % 22
      \C d4 d8 c8 d2 ~ | % 23
      d4 d8 c8 d8 e8 d8 c8 | % 24
      a4 a8 g8 a2 ~  \break | % 25
      a4 a8 g8 a8 b8 a8 g8 | % 26
      e4 e8 d8 e4. d8 | % 27
      e4 e8 d8 e4. e8 | % 28
      a1 | % 29
      r4 \startParenthesis \parenthesize
      c,8 d8 e8 f8 gis8 \endParenthesis \parenthesize a8
      \bar "|." }
} }

harmonies = \chordmode {
  s2. a2:m a:m7+ a:m7 a:m6 f1:7+ f2:7+ e:m7 d1:m7 d2:m7 b:m5-7
  b1:m7/e e:7 a:7+ s
  b2:m5-7 e:7 a1:7+ b2:m5-7 e:7 a1:7+
  as2:m7 des:9- ges1:7+ g2:m7 c:9- f1:7+
  b1:m7/e e:7 f:6 d2:m e:7 f1:7+ f:5-7 a:m/e b2:m7 e:7 a1:m b2:m5-7 e:9-
}


theNotesII = \relative c' {
  \key c \major
  \partial 2. c8 d8 e8 f8 gis8 a8 \noBreak
  \A
  \showStartRepeatBar \bar "[|:"
  \repeat volta 2 {
    b4 b8 a8 b2 ~ | \noBreak
    b4 b8 a8 b8 c8 b8 a8 | \noBreak
    g4 g8 f8 g2 ~ | \noBreak
    g4 g8 f8 g8 a8 g8 f8  \break | % 6
    e4 e8 d8 e2 ~ | % 7
    e4 e8 d8 e8 f8 e8 d8 
  }
  \alternative {
    {
      | % 8
      b1 | % 9
      r4 c8 d8 e8 f8 gis8 a8
      \bar ":|]"
    }
    {
      cis,1 | r4 e4 a4 e'4 | \break }
  } \B
  e8 dis8 e8 cis8 d8 cis8 d8 c8 | % 13
  cis2. e,4 | % 14
  e'8 dis8 e8 cis8 d8 cis8 d8 c8 | % 15
  cis2 r8 cis8 cis8 cis8  \break | % 16
  des8 c8 des8 bes8 ces8 bes8 ces8 a8 | % 17
  bes4. des,8 c8 des8 ges8 bes8 | % 18
  c8 b8 c8 a8 bes8 a8 bes8 gis8 | % 19
  a8 r8 c,8 d8 e8 f8 gis8 a8 \break \bar "||" \break \A
  b4 b8 a8 b2 ~ | % 3
  b4 b8 a8 b8 c8 b8 a8 | % 4
  g4 g8 f8 g2 ~ | % 5
  g4 g8 f8 g8 a8 g8 f8  \break | % 6
  e4 e8 d8 e2 ~ | % 7
  e4 e8 d8 e8 f8 e8 d8 
  
  b'1 ~ | 
  b2 c2 \bar "||" |  \break % 22
  \C d4 d8 c8 d2 ~ | % 23
  d4 d8 c8 d8 e8 d8 c8 | % 24
  a4 a8 g8 a2 ~   % 25
  a4 a8 g8 a8 b8 a8 g8 | \break | % 26
  e4 e8 d8 e4. d8 | % 27
  e4 e8 d8 e4. e8 | % 28
  a1 | % 29
  r4 \startParenthesis \parenthesize
  c,8 d8 e8 f8 gis8 \endParenthesis \parenthesize a8
  \bar "|."
}

harmoniesII = \chordmode {
  s2. a2:m a:m7+ a:m7 a:m6 f1:7+ f2:7+ e:m7 d1:m7 d2:m7 b:m5-7
  b1:m7/e e:7 a:7+ s 
  b2:m5-7 e:7 a1:7+ b2:m5-7 e:7 a1:7+
  as2:m7 des:9- ges1:7+ g2:m7 c:9- f1:7+
  a2:m a:m7+ a:m7 a:m6 f1:7+ f2:7+ e:m7 d1:m7 d2:m7 b:m5-7
  b1:m7/e e:7 f:6 d2:m e:7 f1:7+ f:5-7 a:m/e b2:m7 e:7 a1:m b2:m5-7 e:9-
}

grille = \chordmode {
  \bar "[|:"
  \/ a2:m a:m7+
  \/ a2:m7 a:m6 \startStaff
  f1:7 
  \/ f2:7 e:m7   \startStaff \break
  d1:m7
  \/ d2:m7 b:m5-7  \startStaff
  \set Score.repeatCommands = #'((volta "1"))
  b1:m7/e  
  e:7  
  \set Score.repeatCommands = #'((volta #f)) 
  \bar ":|]" \break
  \stopStaff s 
  \once \override Score.RehearsalMark.transparent = ##t
  \mark \markup \pad-around #3 "1 " \bar "" s \startStaff
  \set Score.repeatCommands = #'((volta "2"))
  \repeat percent 2 { a1:7+ }  \bar "||"
  \set Score.repeatCommands = #'((volta #f)) \break
  \/ b2:m5-7 e:7  \startStaff
  a1:7+
  \/ b2:m5-7 e:7  \startStaff
  a1:7+ \break
  \/ as2:m7 des:9-  \startStaff
  ges1:7+
  \/ g2:m7 c:9-  \startStaff
  f1:7+ \bar ":|]" \break
  \stopStaff s 
  \once \override Score.RehearsalMark.transparent = ##t
  \mark \markup \pad-around #3 "1 " \bar "" s \startStaff
  \set Score.repeatCommands = #'((volta "3"))
  b1:m7/e  
  e:7   \bar "||"
  \set Score.repeatCommands = #'((volta #f)) \break
  f1:6
  \/ d2:m e:7  \startStaff
  f1:7+
  f:5-7 \break
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.transparent = ##t
  \mark \markup \pad-around #1 "1 " 
  a1:m/e
  \/ b2:m7 e:7  \startStaff
  a1:m
  \/ b2:m5-7 e:9- \bar ".."
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*11 
  s1 ^\markup \bold \box \fontsize #7 C
}

verse = \lyricmode {
  What are you do -- ing the rest of your life?
  North and South and East and West of your life
  I have on -- ly one re -- quest of your life
  That you spend it all with me
  All the sea -- sons and the \repeat unfold 4 { \skip 1 }
  see your face in eve -- ry kind of light
  In fields of dawn and fo -- rests of the night
  And when you stand be -- fore the can -- dles on a cake
  Oh, let me be the one to hear the si -- lent wish you make
  Those to -- mor -- rows wai -- ting deep in your eyes __
  In the world of love you keep in your eyes __
  I'll a -- wa -- ken what's as -- leep in your eyes __
  It may take a kiss or two __
  Through all of my life __
  Sum -- mer, Win -- ter, Spring, and Fall of my life __
  All I e -- ver will re -- call of my life
  Is all of my life with you
}
verseB = \lyricmode {
  \repeat unfold 6 { \skip 1 } times of your days
  All the nic -- kels and the dimes of your days
  Let the rea -- sons and the rhymes of your days
  All be -- gin and end with \repeat unfold 7 { \skip 1 } me
  I want to
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
          \harmoniesII
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotesII
          \addlyrics \verse
          \addlyrics \verseB
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
          \transpose c d \harmoniesII
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotesII
          \addlyrics \verse
          \addlyrics \verseB
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
          \transpose c a \harmoniesII
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
          \new Voice = "PartPOneVoiceOne" { \transpose c a \theNotesII }
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  }  } 
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